//
//  ProfileHeaderView.swift
//  JobTracker
//
//  Created by Christian on 1/18/22.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: - UI Properties
    
    let headerStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    let greetingStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        return stackView
    }()
    
    let profileImageView: UIImageView = {
       let imageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let greetingLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.text = "Hello, Christian"
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let aspirationLabel: UILabel = {
       let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "Future iOS Engineer")
        attributedText.addAttribute(NSMutableAttributedString.Key.kern, value: 2, range: NSRange(location: 0, length: attributedText.length))
        label.attributedText = attributedText
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    // MARK: - Initiallizers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        setUpUI()
    }
    
    // MARK: - Set Up UI
    
    private func setUpUI() {
        backgroundColor = .white
        
        greetingStackView.addArrangedSubview(greetingLabel)
        greetingStackView.addArrangedSubview(aspirationLabel)
        
        headerStackView.addArrangedSubview(profileImageView)
        headerStackView.addArrangedSubview(greetingStackView)
        
        addSubview(headerStackView)
        
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 44),
            profileImageView.widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    
    
}
