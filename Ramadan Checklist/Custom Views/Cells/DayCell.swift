//
//  DayCell.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 03/04/2024.
//

import UIKit

class DayCell: UICollectionViewCell {
    
    static let reuseID = "DayCell"
    
    private var circularProgressBar: RCCircularProgressBar!
    let dayLabel = RCTitleLabel(textAlignment: .center, fontSize: 17)
    let weekDayLabel = RCBodyLabel(textAlignment: .center)
    
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureBackgroundView()
        configureProgressView()
        configureStackView()
        
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(day: String, weekDay: String){
//        moonPhaseView.text = "🌚"
        dayLabel.text = day
        weekDayLabel.text = weekDay
        weekDayLabel.font = UIFont.systemFont(ofSize: 14)
    }
    
    private func configureProgressView(){
        let progressBarSize: CGFloat = 10
        let progressBarFrame = CGRect(x: (stackView.bounds.width - progressBarSize) / 2,
                                      y: (stackView.bounds.height - progressBarSize) / 2,
                                      width: progressBarSize,
                                      height: progressBarSize)
        
        circularProgressBar = RCCircularProgressBar(frame: progressBarFrame)
        
        // Set this to whatever progress value you need (0 to 1)
       // circularProgressBar.setProgress(to: 0.35, animated: true)
    }
    
    private func configureStackView(){
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        
        //stackView.addArrangedSubview(moonPhaseView)
        stackView.addArrangedSubview(circularProgressBar)
        stackView.addArrangedSubview(dayLabel)
        stackView.addArrangedSubview(weekDayLabel)
    }
    
    private func configureBackgroundView(){
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .systemPink
    }
    
    private func configure(){
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 5
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    
}
