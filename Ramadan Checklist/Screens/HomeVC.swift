//
//  HomeViewController.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 03/04/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    var collectionView: MainCollectionView!
    let headerTexts = RCHeaderTextView()
    let weekInfo = RCWeekInfoView()
    let todoList = RCTodoView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        //title = "Hello, test"
        headerTexts.set(user: "Aida")
        setupCollectionView()
    }
    
   
    private func setupCollectionView() {
            collectionView = MainCollectionView()
            view.addSubview(collectionView)
            
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    
    

}
