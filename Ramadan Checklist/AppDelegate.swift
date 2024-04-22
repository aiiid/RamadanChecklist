import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let dataStorage = DataStorage()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupCoreData()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    
    // MARK: - User Defaults, CoreData setup
    private func setupCoreData() {
        let isFirstRun = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        print("inside firstRun")
        if !isFirstRun {
            // Load the data from JSON as it's the first run
            loadDataFromJSON()

            // Set the flag to true to indicate that the app has launched before
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
            UserDefaults.standard.synchronize() // Synchronize user defaults
        }
    }
    
    private func loadDataFromJSON(){
        // Load your JSON file and parse it
        // Create Core Data objects and save them
        let context = persistentContainer.viewContext
        print("im here")
        var tasks: [Task] = []
        
        switch dataStorage.loadJsonData() {
        case .success(let result):
            print(result)
            tasks = result.tasks
        case .failure(let error):
            print(error.localizedDescription)
        }
        
        for taskInfo in tasks {
            let newTask = CoreDataTask(context: context)
            newTask.title = taskInfo.title
            newTask.id = UUID().uuidString
        }
        
        saveContext()
    }
    
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SecondModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
