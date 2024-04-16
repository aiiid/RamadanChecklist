//
//  TaskCell.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 16/04/2024.
//

import UIKit

class TodoCell: UITableViewCell {

    static let reuseIdentifier = "TodoCell"
    
    let taskLabel = RCTitleLabel(textAlignment: .center, fontSize: 25)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }

    private func configure(){
        contentView.addSubview(taskLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
                    taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
                    taskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                    taskLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
                    taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
                ])
    }
    
    func set(taskLabel: String){
        self.taskLabel.text = taskLabel
    }
   
}
