//
//  JSONLoader.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 20/04/2024.
//

import Foundation
import CoreData

enum LoadError: Error {
    case fileNotFound
    case dataReadError(Error)
    case decodingError(Error)
}

struct DataStorage{
    func loadJsonData() -> Result<RamadanChecklist, LoadError> {
        guard let url = Bundle.main.url(forResource: "RamadanChecklist", withExtension: ".json") else {
            return .failure(.fileNotFound)
        }
        do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                let checklist = try jsonDecoder.decode(RamadanChecklist.self, from: data)
            return .success(checklist)
            } catch {
                print("Error decoding Course data:", error)
                return .failure(.decodingError(error))
            }
        }
    
    func fetchTasksFromCoreData(context: NSManagedObjectContext) -> [CoreDataTask] {
        let fetchRequest: NSFetchRequest<CoreDataTask> = CoreDataTask.fetchRequest()
        do {
            let tasks = try context.fetch(fetchRequest)
            return tasks
        } catch {
            print("Error fetching tasks from Core Data: \(error.localizedDescription)")
            return []
        }
    }
        
    }
    
    

