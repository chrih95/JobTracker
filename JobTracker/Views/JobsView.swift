//
//  JobsView.swift
//  JobTracker
//
//  Created by Christian on 1/20/22.
//

import Foundation
import UIKit

class JobsView: UIView {
    
    // MARK: - UI Properties
    
    let filterView: FavoritesFilterView = {
       let filter = FavoritesFilterView()
        filter.translatesAutoresizingMaskIntoConstraints = false
        return filter
    }()
    
    let jobCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "Smoke")
        collectionView.register(JobTileCollectionViewCell.self, forCellWithReuseIdentifier: "JobTileCell")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        self.backgroundColor = UIColor(named: "Smoke")
        self.layer.cornerRadius = 40
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        jobCollectionView.delegate = self
        jobCollectionView.dataSource = self
        
        addSubview(filterView)
        addSubview(jobCollectionView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            filterView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            filterView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            
            jobCollectionView.topAnchor.constraint(equalTo: filterView.bottomAnchor, constant: 15),
            jobCollectionView.leadingAnchor.constraint(equalTo: filterView.leadingAnchor),
            jobCollectionView.trailingAnchor.constraint(equalTo: filterView.trailingAnchor),
            jobCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension JobsView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JobTileCell", for: indexPath) as? JobTileCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.lastUpdatedText = "today"
        cell.tileBackgroundColor = UIColor(named: "SkyBlue")
        cell.isFavorited = true
        cell.companyLabelText = "Google"
        cell.locationLabelText = "California"
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension JobsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dimension = frame.size.width/2 - 36
        
        return CGSize(width: dimension, height: dimension)
    }
}
