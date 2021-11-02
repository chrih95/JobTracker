//
//  LastUpdatedBubbleView.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 10/24/21.
//

import UIKit

class LastUpdatedBubbleView: UIView {
    
    var lastUpdatedString: String = "" {
        didSet {
            someLabel.text = lastUpdatedString
        }
    }
    
    private let someLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkGray
        label.textAlignment = .center
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
        backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        layer.cornerRadius = 14
        
        addSubview(someLabel)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            someLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            someLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            someLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            someLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
        ])
        
        someLabel.setContentHuggingPriority(.required, for: .horizontal)
    }
}
