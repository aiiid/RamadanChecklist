//
//  RCWeekInfoView.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 04/04/2024.
//

import UIKit

class RCWeekInfoView: UIView {
    let dateRangeLabel = RCCaptionLabel()
    let weekContainerView = RCWeekCollectionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .systemBlue
        addSubview(weekContainerView)
        addSubview(dateRangeLabel)
        translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 5
        let containerViewSize: CGFloat = 100
        
        NSLayoutConstraint.activate([
            dateRangeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
            dateRangeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            dateRangeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dateRangeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            weekContainerView.topAnchor.constraint(equalTo: dateRangeLabel.bottomAnchor),
            weekContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            weekContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            weekContainerView.heightAnchor.constraint(equalToConstant: containerViewSize)
        ])
        
        weekContainerView.updateConfiguration(.init(cellHeight: containerViewSize - padding * CGFloat(2), cellWidth: 43))
    }
    
    func setDateRange(from start: String, to end: String){
        dateRangeLabel.text = "From \(start) to \(end)"
    }
    
}
