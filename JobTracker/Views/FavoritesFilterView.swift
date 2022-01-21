//
//  FavoritesFilterView.swift
//  JobTracker
//
//  Created by Christian on 1/20/22.
//

import Foundation
import UIKit

class FavoritesFilterView: UIView {
    
    
    // MARK: - UI Properties
    
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .white
        return imageView
    }()
    
    let filterLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.text = "view favorites"
        label.textAlignment = .left
        return label
    }()
    
    let tapGestureRecognizer: UIGestureRecognizer = {
       let gesture = UIGestureRecognizer()
        return gesture
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpUI() {
        backgroundColor = UIColor(named: "Rose")
        layer.cornerRadius = 20
        
        tapGestureRecognizer.addTarget(self, action: #selector(filterTapped))
        addGestureRecognizer(tapGestureRecognizer)
        
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(filterLabel)
        
        addSubview(stackView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func filterTapped() {
        print("filter tapped!")
    }
}
