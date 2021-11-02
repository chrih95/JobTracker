//
//  JobTileView.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 10/24/21.
//

import UIKit

class JobTileCollectionViewCell: UICollectionViewCell {
    
// MARK: - Parameter Properties
    var isFavorited: Bool = false {
        didSet {
            favoriteHeartView.isHidden = !isFavorited
        }
    }
    
    var lastUpdatedText: String = "" {
        didSet {
            if !lastUpdatedText.isEmpty {
                lastUpdatedBubbleView.lastUpdatedString = lastUpdatedText
            }
        }
    }
    
    var companyName: String = "" {
        didSet {
            companyLabel.text = companyName
        }
    }
    
    var locationText: String = "" {
        didSet {
            locationLabel.text = "📍 \(locationText)"
        }
    }
    
    var statusColor: UIColor?  {
        didSet {
            backgroundColor = statusColor ?? UIColor.gray
        }
    }
    
// MARK: - UI Component Declarations

    private let favoriteHeartView: UIImageView = {
        let heartImage = UIImageView()
        heartImage.image = UIImage(systemName: "heart.fill")
        heartImage.tintColor = UIColor(named: "Blush")
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        return heartImage
    }()
    
    private let lastUpdatedBubbleView: LastUpdatedBubbleView = {
        let bubbleView = LastUpdatedBubbleView()
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        return bubbleView
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
// MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        layer.cornerRadius = 30
        alpha = 0.9
        
        contentView.addSubview(favoriteHeartView)
        contentView.addSubview(lastUpdatedBubbleView)
        
        labelStackView.addArrangedSubview(companyLabel)
        labelStackView.addArrangedSubview(locationLabel)
        contentView.addSubview(labelStackView)
    }
    
    private func activateConstraints() {
        let heartAndBubbleViewConstraint = favoriteHeartView.trailingAnchor.constraint(greaterThanOrEqualTo: lastUpdatedBubbleView.leadingAnchor, constant: -8)
        heartAndBubbleViewConstraint.priority = .defaultLow

        
        NSLayoutConstraint.activate([
            favoriteHeartView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            favoriteHeartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            favoriteHeartView.heightAnchor.constraint(equalToConstant: 25),
            favoriteHeartView.widthAnchor.constraint(equalToConstant: 25),
            
            lastUpdatedBubbleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            lastUpdatedBubbleView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            heartAndBubbleViewConstraint,
            
            labelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            labelStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}
