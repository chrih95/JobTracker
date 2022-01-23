//
//  EditTextFieldView.swift
//  JobTracker
//
//  Created by Christian on 1/23/22.
//

import Foundation
import UIKit

class EditTextFieldView: UIView {
    
    var userEnteredText: String {
        get {
            guard let text = textField.text else {
                return ""
            }
            
            return text
        }
    }
    
    var fieldNameText: String? {
        didSet {
            guard let fieldNameText = fieldNameText else {
                return
            }

            let attributedText = NSMutableAttributedString(string: fieldNameText)
            attributedText.addAttribute(NSMutableAttributedString.Key.kern, value: 3, range: NSRange(location: 0, length: attributedText.length))
            
            fieldLabel.attributedText = attributedText
        }
    }
    
    // MARK: - UI Properties
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 8
        return stackView
    }()
    
    private let fieldLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .left
        label.textColor = .darkGray
        return label
    }()
    
    private let textField: JobDetailTextField = {
       let textField = JobDetailTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.backgroundColor = .white
        return textField
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
        backgroundColor = UIColor(named: "Smoke")
        
        stackView.addArrangedSubview(fieldLabel)
        stackView.addArrangedSubview(textField)
        
        addSubview(stackView)
       
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            textField.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
