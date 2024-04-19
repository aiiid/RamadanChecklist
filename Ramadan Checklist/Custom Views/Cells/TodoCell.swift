//
//  TaskCell.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 16/04/2024.
//

import UIKit

//Cell with checkmark settings

class TodoCell: UITableViewCell {

    static let reuseIdentifier = "TodoCell"
    
    let taskLabel = RCTitleLabel(textAlignment: .left, fontSize: 25)
    let customCheckmark = UIImageView()
    
    var isChecked: Bool = false {
        didSet{
            if isChecked {
                customCheckmark.image = UIImage(systemName: "checkmark.square.fill")
            } else {
                customCheckmark.image = UIImage(systemName: "square")
            }
        }
    }
    
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
        contentView.addSubview(customCheckmark)
        
        customCheckmark.image = UIImage(systemName: "square")
        
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        customCheckmark.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
                    //taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
                    taskLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                    taskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                    taskLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
                    //taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
                    
                    customCheckmark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
                    customCheckmark.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                    customCheckmark.widthAnchor.constraint(equalToConstant: 24), // Adjust size as needed
                    customCheckmark.heightAnchor.constraint(equalToConstant: 24)
                          
                ])
        
    }
    
    func set(taskLabel: String){
        self.taskLabel.text = taskLabel
    }
   
}
