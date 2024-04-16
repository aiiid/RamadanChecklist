//
//  RCWeekView.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 04/04/2024.
//

import UIKit

class RCWeekCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    struct Configuration {
            var cellHeight: CGFloat = 80 // Default values
            var cellWidth: CGFloat = 100 // Default values
            // Add more configuration options as needed
        }
    var configuration = Configuration()
    
    private let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            // Configure collection view properties
            return collectionView
        }()
    
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateConfiguration(_ configuration: Configuration){
        self.configuration = configuration
        collectionView.reloadData()
    }
    
    private func configure(){
        addSubview(collectionView)
        translatesAutoresizingMaskIntoConstraints = false
        
        
        // Set up constraints for collection view
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(DayCell.self, forCellWithReuseIdentifier: DayCell.reuseID)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.reuseID, for: indexPath) as! DayCell
        cell.set(day: String(indexPath.item), weekDay: "Mon")
                // Configure your cell with data
                // cell.configure(with: data[indexPath.item])
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: configuration.cellWidth, height: configuration.cellHeight)
        }
    
}
