//
//  RCCalendarViewVC.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 03/04/2024.
//

import UIKit

class RCCalendarViewVC: UIViewController {
    let titleLabel = RCTitleLabel(textAlignment: .left, fontSize: 30)
    let bodyLabel = RCBodyLabel(textAlignment: .left)
    let captionLabel = RCCaptionLabel(textAlignment: .left)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
        addSubviews()
        layoutUI()
        
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUIElements(){
        titleLabel.text = "Ramadan Careem!"
        bodyLabel.text = "7 days til Eid Al Fitr"
        captionLabel.text = "Welcome, Aida"
    }
    
    func addSubviews(){
        view.addSubview(captionLabel)
        view.addSubview(titleLabel)
        view.addSubview(bodyLabel)
    }
    
    func layoutUI(){
        let padding: CGFloat = 3
        
        NSLayoutConstraint.activate([
            captionLabel.topAnchor.constraint(equalTo: view.topAnchor),
            captionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            captionLabel.heightAnchor.constraint(equalToConstant: 20),

            titleLabel.topAnchor.constraint(equalTo: captionLabel.bottomAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),

            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding), // Assuming bodyLabel is a subview of view
            bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bodyLabel.heightAnchor.constraint(equalToConstant: 28)
        ])

    }

}
