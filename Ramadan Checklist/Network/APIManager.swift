//
//  APIManager.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 14/03/2024.
//

import UIKit

class APIManager{
    func loadImage(id: Int,completion: @escaping(UIImage?) -> ()) {
        let url = URL(string: urlString + "\(id)")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            if let data, let postImage =  try? JSONDecoder().decode(PostImages.self, from: data){
                self.loadImageContent(url: postImage.url, completion: completion)
            }
        }
        task.resume()
    }
    
    private func loadImageContent(url: String, completion: @escaping (UIImage?) -> ()){
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: url)!)){ data, response, error in
            if let data = data, let image = UIImage(data: data){
                completion(image)
            }else{
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    //MARK: - Private constants
    private let urlString = "https://jsonplaceholder.typicode.com/photos/"
}
