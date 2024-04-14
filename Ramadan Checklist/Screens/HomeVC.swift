//
//  HomeViewController.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 03/04/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    var collectionView: UICollectionView!
    let headerTexts = RCHeaderTextView()
    let weekInfo = RCWeekInfoView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        //title = "Hello, test"
        headerTexts.set(user: "Aida")
        configurePage()
    }
    
   
    func configurePage(){
        let padding: CGFloat = 20
        
        view.addSubview(headerTexts)
        view.addSubview(weekInfo)
        
        weekInfo.setDateRange(from: "March 11", to: "April 10")
        
        headerTexts.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerTexts.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerTexts.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            headerTexts.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            headerTexts.heightAnchor.constraint(equalToConstant: 80),
            
            weekInfo.topAnchor.constraint(equalTo: headerTexts.bottomAnchor, constant: padding),
            weekInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            weekInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            weekInfo.heightAnchor.constraint(equalToConstant: 150) 
        ])
        
    }
    
    

}