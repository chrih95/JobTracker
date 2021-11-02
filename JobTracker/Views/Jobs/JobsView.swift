//
//  JobsView.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 10/24/21.
//

import UIKit

class JobsView: UIView {
    
    let favoritesFilterView: FavoritesFilterView = {
        let favoritesFilterview = FavoritesFilterView()
        favoritesFilterview.translatesAutoresizingMaskIntoConstraints = false
        return favoritesFilterview
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
//        collectionViewFlowLayout.minimumLineSpacing = 20
//        collectionViewFlowLayout.minimumInteritemSpacing = 10
//        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.register(JobTileCollectionViewCell.self, forCellWithReuseIdentifier: "JobTileCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "Smoke")
        return collectionView
    }()

// MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "Smoke")
        self.layer.cornerRadius = 40
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
        activateConstraints()
    }
    
// MARK: - UI Setup Functions
    private func setupUI() {
        addSubview(favoritesFilterView)
        addSubview(collectionView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            favoritesFilterView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            favoritesFilterView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            
            collectionView.topAnchor.constraint(equalTo: favoritesFilterView.bottomAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
        ])
    }
}

extension JobsView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("YOOO")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JobTileCell", for: indexPath) as? JobTileCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.lastUpdatedText = "today"
        cell.statusColor = UIColor(named: "Moss")
        cell.isFavorited = true
        cell.companyName = "Nike"
        cell.locationText = "Portland"
        
        return cell
    }
}

extension JobsView: UICollectionViewDelegate {

}

extension JobsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                                 sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension = frame.size.width/2 - 36
        return CGSize(width: dimension, height: dimension)
    }
}
