//
//  RCHeaderTextView.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 04/04/2024.
//

import UIKit

class RCHeaderTextView: UIView {
    let titleLabel = RCTitleLabel(textAlignment: .left, fontSize: 30)
    let bodyLabel = RCBodyLabel(textAlignment: .left)
    let captionLabel = RCCaptionLabel(textAlignment: .left)
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .systemMint
        
        addSubview(captionLabel)
        addSubview(titleLabel)
        addSubview(bodyLabel)
        
        let padding: CGFloat = 3
        
        NSLayoutConstraint.activate([
            captionLabel.topAnchor.constraint(equalTo: self.topAnchor),
            captionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            captionLabel.heightAnchor.constraint(equalToConstant: 20),

            titleLabel.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),

            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding), // Assuming bodyLabel is a subview of view
            bodyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bodyLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func set(user: String){
        titleLabel.text = "Ramadan Careem!"
        bodyLabel.text = "7 days til Eid Al Fitr"
        captionLabel.text = "Welcome, \(user)"
    }
    
    
}
