//
//  EditFieldView.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 11/1/21.
//

import UIKit

class EditFieldView: UIView {
    
    var enteredText: String {
        get {
            guard let text = textField.text else {
                return ""
            }
            return text
        }
    }
    
    var fieldName: String? {
        didSet {
            guard let fieldName = fieldName else {
                return
            }
            
            let attributedString = NSMutableAttributedString(string: fieldName)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: 3, range: NSRange(location: 0, length: attributedString.length))
            someLabel.attributedText = attributedString
        }
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let someLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .darkGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: TextFieldWithSpacing = {
        let textField = TextFieldWithSpacing()
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.backgroundColor = .white
        return textField
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
        stackView.addArrangedSubview(someLabel)
        stackView.addArrangedSubview(textField)
        addSubview(stackView)
        
        backgroundColor = UIColor(named: "Smoke")
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.widthAnchor.constraint(equalTo: widthAnchor),
        ])
    }
}
