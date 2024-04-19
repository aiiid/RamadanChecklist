//
//  RCTodoView.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 16/04/2024.
//

import UIKit

//whole ToDo containver View

class RCTodoView: UIView {

    let titleLabel = RCTitleLabel(textAlignment: .left, fontSize: 20)
    let dayLabel = RCTitleLabel(textAlignment: .center, fontSize: 20)
    let tableView = RCTodoList()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            configure()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func configure() {
            // Add labels and table view to the view
            addSubview(titleLabel)
            addSubview(dayLabel)
            addSubview(tableView)

            backgroundColor = .systemTeal
            // Set up labels
            titleLabel.text = "Ramadan checklist"
            dayLabel.text = "day 2"

           
            // Configure layout constraints
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            dayLabel.translatesAutoresizingMaskIntoConstraints = false
            tableView.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                // Position the labels above the table view
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

                dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
                //dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

                // Position the table view below the labels
                tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    }
    
