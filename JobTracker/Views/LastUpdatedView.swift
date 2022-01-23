//
//  LastUpdatedView.swift
//  JobTracker
//
//  Created by Christian on 1/22/22.
//

import Foundation
import UIKit

class LastUpdatedView: UIView {
    
    var lastUpdatedText: String = "" {
        didSet {
            lastUpdatedLabel.text = lastUpdatedText
        }
    }
    
    // MARK: - UI Properties
    
    private let lastUpdatedLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        setUpUI()
    }
    
    private func setUpUI() {
        backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        
        layer.cornerRadius = 14
        
        addSubview(lastUpdatedLabel)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            lastUpdatedLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            lastUpdatedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            lastUpdatedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            lastUpdatedLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6)
        ])
        
        lastUpdatedLabel.setContentHuggingPriority(.required, for: .horizontal)
    }
}
