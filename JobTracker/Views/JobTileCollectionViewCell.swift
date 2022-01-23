//
//  JobTileCollectionViewCell.swift
//  JobTracker
//
//  Created by Christian on 1/22/22.
//

import Foundation
import UIKit

class JobTileCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    let heartView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = UIColor(named: "Blush")
        return imageView
    }()
    
    let lastUpdatedView: LastUpdatedView = {
       let view = LastUpdatedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let labelStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        return stackView
    }()
    
    let companyLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    let locationLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
}
