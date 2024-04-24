//
//  MainCollectionView.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 24/04/2024.
//

import UIKit

enum SectionType{
    case month
    case checklist
}


class MainCollectionView: UICollectionView{
    
    init() {
        super.init(frame: .zero, collectionViewLayout: MainCollectionView.createDynamicLayout())
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollectionView() {
        self.backgroundColor = .white
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // Register cell classes
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        // Set up data source and delegate
        self.dataSource = self
        self.delegate = self
    }
    
    static func createDynamicLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return MainCollectionView.createFirstSectionLayout()
            case 1:
                return MainCollectionView.createSecondSectionLayout()
            default:
                return MainCollectionView.createDefaultSectionLayout()
            }
        }
        return layout
    }
    static func createFirstSectionLayout() -> NSCollectionLayoutSection {
        // Define item sizes, group sizes, and sections
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    static func createSecondSectionLayout() -> NSCollectionLayoutSection {
        // Adjust item sizes for better visibility
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(200)) // Increased from 100 for better visibility
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20 // Increased spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20) // Ensure there are insets
        return section
    }

    
    static func createDefaultSectionLayout() -> NSCollectionLayoutSection {
        // Default layout for other sections
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}


extension MainCollectionView: UICollectionViewDataSource, UICollectionViewDelegate  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // Example item count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        print("Configuring cell at section: \(indexPath.section), row: \(indexPath.row)") // Debugging
        if indexPath.section == 0 {
            cell.backgroundColor = .blue
        } else if indexPath.section == 1 {
            cell.backgroundColor = .systemRed
        } else {
            cell.backgroundColor = .gray // Default color for unspecified sections
        }
        return cell
    }

}

