////
////  DataStorage.swift
////  Ramadan Checklist
////
////  Created by Ai Hawok on 14/03/2024.
////
//
//import Foundation
//
//enum LoadError: Error {
//    case fileNotFound
//    case dataReadError(Error)
//    case decodingError(Error)
//}
//
//struct DataStorage{
//    
//    func loadData() -> Result<Ramadan, LoadError> {
//        guard let url = Bundle.main.url(forResource: "moon_data", withExtension: ".json") else {
//            return .failure(.fileNotFound)
//        }
//        do {
//                let data = try Data(contentsOf: url)   
//                let jsonDecoder = JSONDecoder()
//                let month = try jsonDecoder.decode(Ramadan.self, from: data)
//            return .success(month)
//            } catch {
//                print("Error decoding Course data:", error)
//                return .failure(.decodingError(error))
//            }
//        }
//        
//    }
//    
//    
//
