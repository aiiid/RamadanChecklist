//
//  ImageCell.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 14/03/2024.
//
import SnapKit
import UIKit

class ImageCell: UICollectionViewCell{
    //MARK: - Public
    func configure(day: Day){
        emoji.text = day.emoji
        date.text = String(Date.convert(dateString: day.date).day)
        weekDay.text = String(Date.convert(dateString: day.date).weekday)
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private properties
    private let backgroundLayer = CAShapeLayer()
    
    private let date: UILabel = {
      let label = UILabel()
      label.textAlignment = .center // Center the text within the label
      label.textColor = .white // Adjust text color as needed
      label.font = .systemFont(ofSize: 20, weight: .bold) // Adjust font size and weight
      return label
    }()
    private let emoji: UILabel = {
      let label = UILabel()
      label.textAlignment = .center // Center the text within the label
      label.textColor = .white // Adjust text color as needed
      label.font = .systemFont(ofSize: 16, weight: .bold) // Adjust font size and weight
      return label
    }()
    private let weekDay: UILabel = {
        let label = UILabel()
        label.textAlignment = .center // Center the text within the label
        label.textColor = .white // Adjust text color as needed
        label.font = .systemFont(ofSize: 16, weight: .light) // Adjust font size and weight
        return label
    }()
    
}

//MARK: - Private methods
private extension ImageCell{
    func initialize(){
        setupViews()
        configureLayout()
    }
    
    func setupViews(){
        contentView.layer.addSublayer(backgroundLayer)
        contentView.addSubview(emoji)
        contentView.addSubview(date)
        contentView.addSubview(weekDay)
    }
    func configureLayout(){
        backgroundLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 10.0).cgPath
        backgroundLayer.fillColor = UIColor.lightGray.cgColor
        
        emoji.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }
        
        date.snp.makeConstraints { make in
            make.top.equalTo(emoji.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        weekDay.snp.makeConstraints { make in
            make.top.equalTo(date.snp.bottom).offset(3)
            make.centerX.equalToSuperview()
        }
        
    }
}







