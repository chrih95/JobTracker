//
//  AddJobButtonView.swift
//  JobTracker
//
//  Created by Christian on 1/18/22.
//

import Foundation
import UIKit

protocol AddButtonDelegate: AnyObject {
    func addJob()
}

class AddJobButtonView: UIView {
    
    weak var delegate: AddButtonDelegate?
    
    // MARK: - UI Properties
    
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        return stackView
    }()
    
    let addButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = UIColor(named: "Rose")
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let spacerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: - Initializers
    
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
        
        stackView.addArrangedSubview(addButton)
        stackView.addArrangedSubview(spacerView)
        
        addSubview(stackView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            addButton.heightAnchor.constraint(equalToConstant: 54),
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor),
            
            spacerView.heightAnchor.constraint(equalToConstant: 20),
            spacerView.widthAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    @objc private func addButtonPressed() {
        delegate?.addJob()
    }
}
