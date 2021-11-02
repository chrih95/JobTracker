//
//  EditFieldView.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 11/1/21.
//

import UIKit

class EditFieldTableViewCell: UITableViewCell {
    
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let someLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 17)
        return textField
    }()

// MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
        contentView.addSubview(stackView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
