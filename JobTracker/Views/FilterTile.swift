//
//  FilterTile.swift
//  JobTracker
//
//  Created by Christian on 1/19/22.
//

import Foundation
import UIKit

class FilterTile: UIView {
    
    // UI Properties
    
    var textColor: UIColor? {
        didSet {
            if let textColor = textColor {
                filterNameLabel.textColor = textColor
                filterCountLabel.textColor = textColor
            }
        }
    }
    
    var filterNameText: String = "" {
        didSet {
            let attributedText = NSMutableAttributedString(string: filterNameText)
            attributedText.addAttribute(NSAttributedString.Key.kern, value: 1, range: NSRange(location: 0, length: attributedText.length))
            filterNameLabel.attributedText = attributedText
        }
    }
    
    var filterCount: Int = 0 {
        didSet {
            filterCountLabel.text = "\(filterCount)"
        }
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    
    let filterNameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    let filterCountLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
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
        self.backgroundColor = UIColor(named: "Smoke")
        self.layer.cornerRadius = 20
        
        stackView.addArrangedSubview(filterNameLabel)
        stackView.addArrangedSubview(filterCountLabel)
        
        addSubview(stackView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 4),
            stackView.leadingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -4),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            heightAnchor.constraint(equalToConstant: 76)
        ])
    }
}
