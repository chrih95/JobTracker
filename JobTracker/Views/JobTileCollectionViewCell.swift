//
//  JobTileCollectionViewCell.swift
//  JobTracker
//
//  Created by Christian on 1/22/22.
//

import Foundation
import UIKit

class JobTileCollectionViewCell: UICollectionViewCell {
    
    var tileBackgroundColor: UIColor? {
        didSet {
            backgroundColor = tileBackgroundColor ?? UIColor.gray
        }
    }
    
    var isFavorited: Bool = false {
        didSet {
            heartView.isHidden = !isFavorited
        }
    }
    
    var lastUpdatedText: String = "" {
        didSet {
            if !lastUpdatedText.isEmpty {
                lastUpdatedView.lastUpdatedText = lastUpdatedText
            }
        }
    }
    
    var companyLabelText: String = "" {
        didSet {
            if !companyLabelText.isEmpty {
                companyLabel.text = companyLabelText
            }
        }
    }
    
    var locationLabelText: String = "" {
        didSet {
            if !locationLabelText.isEmpty {
                locationLabel.text = "📍 \(locationLabelText)"
            }
        }
    }
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        layer.cornerRadius = 30
        alpha = 0.9
        
        contentView.addSubview(heartView)
        contentView.addSubview(lastUpdatedView)
        
        labelStackView.addArrangedSubview(companyLabel)
        labelStackView.addArrangedSubview(locationLabel)
            
        contentView.addSubview(labelStackView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        let heartAndBubbleConstraint = heartView.trailingAnchor.constraint(greaterThanOrEqualTo: lastUpdatedView.leadingAnchor, constant: -8)
        heartAndBubbleConstraint.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            heartView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            heartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            heartView.heightAnchor.constraint(equalToConstant: 25),
            heartView.widthAnchor.constraint(equalTo: heartView.heightAnchor),
            
            lastUpdatedView.topAnchor.constraint(equalTo: heartView.topAnchor),
            lastUpdatedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            labelStackView.leadingAnchor.constraint(equalTo: heartView.leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: lastUpdatedView.trailingAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            heartAndBubbleConstraint,
        ])
    }
}
