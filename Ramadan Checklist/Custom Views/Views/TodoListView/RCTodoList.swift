//
//  RCTodoListView.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 16/04/2024.
//

import UIKit
import CoreData

//To Do list settings is here.

class RCTodoList: UITableView {
    let dataStorage = DataStorage()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tasks = [CoreDataTask]()
    var currentDate = Date.now
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        loadData()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView(){
        backgroundColor = .systemMint
        
        dataSource = self
        delegate = self
        register(TodoCell.self,forCellReuseIdentifier: TodoCell.reuseIdentifier)
    }
    
    private func loadData(){
        print("should be loaded from coredata")
        tasks = dataStorage.fetchTasksFromCoreData(context: context)
    }
    
    private func saveContext() {
        do {
            try context.save()
            print("saved context")
        } catch {
            print("Error saving context \(error)")
        }
        
//        self.reloadData()
        loadData()
    }
    
    func dateFromString(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.date(from: dateString)
    }
}

extension RCTodoList: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoCell.reuseIdentifier, for: indexPath) as! TodoCell
        cell.set(taskLabel: tasks[indexPath.row].title!)
        
        return cell
    }
    
    
}

extension RCTodoList: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row selected \(indexPath.row)")
        guard let cell = tableView.cellForRow(at: indexPath) as? TodoCell else { return }
        cell.isChecked = !cell.isChecked
        
        let task = tasks[indexPath.row]
        // Create or update Completion object for the current date
        let date = dateFromString("22.04.24")!

        
        // Check if there is an existing completion object for the selected task and date
               let completionFetchRequest: NSFetchRequest<Completion> = Completion.fetchRequest()
               completionFetchRequest.predicate = NSPredicate(format: "task == %@ AND date == %@", task, date as CVarArg)
               
               do {
                   let existingCompletions = try context.fetch(completionFetchRequest)
                   if let existingCompletion = existingCompletions.first {
                       // Update existing completion
                       existingCompletion.isCompleted = cell.isChecked
                   } else {
                       // Create new completion
                       let newCompletion = Completion(context: context)
                       newCompletion.date = date
                       newCompletion.isCompleted = cell.isChecked
                       newCompletion.task = task
                   }
                   
                   // Save the changes to Core Data
                   saveContext()
               } catch {
                   print("Error fetching completion objects: \(error)")
               }
    }
}
