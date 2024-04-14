//
//  ViewController.swift
//  Ramadan Checklist
//
//  Created by Ai Hawok on 13/03/2024.
//
import SnapKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        //loadImages()
        loadData()
    }
    
    //MARK: - Private properties
    private var collectionView: UICollectionView!
    //private var images: [UIImage?] = []
    private var apiManager = APIManager()
    private var month: [Day] = []
}

//MARK: - Private Methods
private extension ViewController{
    func initialize(){
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        view.addSubview(collectionView)
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(hexString: "FEC674")
        backgroundView.layer.cornerRadius = 10.0
        backgroundView.clipsToBounds = false
        view.addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(50) // Adjust top inset as needed
            make.bottom.equalTo(collectionView.snp.top) // Pin to collection view bottom
        }
        collectionView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().offset(16)
            make.top.equalToSuperview().inset(50)
            make.height.equalTo(150)
        }
        
        collectionView.dataSource = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self //why we put self to delegate?
        collectionView.showsHorizontalScrollIndicator = false
    }
        
    
    func loadData(){
        let result = DataStorage().loadData()
        switch result{
        case .success(let loadedMonth):
            self.month = loadedMonth.month
            print("data Loaded")
        case .failure(let error):
              print("Error loading data:", error)
              // Handle the error appropriately (e.g., display an error message)
        }
    }
}


//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        month.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell
        //why indexPath.item not row? its only for collectionview?
        cell.configure(day: month[indexPath.item])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 40, height: 60)
    }
}


