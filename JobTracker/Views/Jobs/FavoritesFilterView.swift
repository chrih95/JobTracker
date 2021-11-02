//
//  FavoritesFilterView.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 10/24/21.
//

import UIKit

class FavoritesFilterView: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let filterLabel: UILabel = {
        let label = UILabel()
        label.text = "view favorites"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tapGesture: UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer()
        return tapGesture
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
        backgroundColor = UIColor(named: "Rose")
        layer.cornerRadius = 20
        
        tapGesture.addTarget(self, action: #selector(didTapFilter))
        addGestureRecognizer(tapGesture)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(filterLabel)
        addSubview(stackView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func didTapFilter() {
        print("tapped!")
    }
}
