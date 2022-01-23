//
//  ChangeJobViewController.swift
//  JobTracker
//
//  Created by Christian on 1/23/22.
//

import Foundation
import UIKit

enum EditMode {
    case add, edit
}

class ChangeJobViewController: UIViewController {
    
    let editMode: EditMode
    
    private let addTitle = "Add a new job"
    private let editTitle = "Edit job details"
    
    // MARK: - UI Properties
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        stackView.alignment = .leading
        return stackView
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private let companyField: EditTextFieldView = {
        let view = EditTextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.fieldNameText = "company"
        return view
    }()
    
    private let roleField: EditTextFieldView = {
        let view = EditTextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.fieldNameText = "role"
        return view
    }()
    
    private let teamField: EditTextFieldView = {
        let view = EditTextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.fieldNameText = "team · organization"
        return view
    }()
    
    private let locationField: EditTextFieldView = {
        let view = EditTextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.fieldNameText = "📍 location"
        return view
    }()
    
    private let linkField: EditTextFieldView = {
        let view = EditTextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.fieldNameText = "link"
        return view
    }()
    
    private let notesField: EditTextFieldView = {
        let view = EditTextFieldView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.fieldNameText = "notes"
        return view
    }()
    
    init(withEditMode editMode: EditMode) {
            self.editMode = editMode
            
            super.init(nibName: nil, bundle: nil)
            
            setUpUI()
        }
    
    required init?(coder: NSCoder) {
        self.editMode = .add
        
        fatalError("init(coder:) has not been implemented")
        
        setUpUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setUpUI() {
        view.backgroundColor = UIColor(named: "Smoke")
        
        title = editMode == .add ? addTitle : editTitle
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTapped))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "Rose")
        
        stackView.addArrangedSubview(companyField)
        stackView.addArrangedSubview(roleField)
        stackView.addArrangedSubview(teamField)
        stackView.addArrangedSubview(locationField)
        stackView.addArrangedSubview(linkField)
        stackView.addArrangedSubview(notesField)
        
        scrollView.addSubview(stackView)
        
        view.addSubview(scrollView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            companyField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            roleField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            teamField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            locationField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            linkField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            notesField.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
        
        stackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        companyField.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
    
    @objc func saveTapped() {
        print("Save Tapped")
        dismiss(animated: true, completion: nil)
    }
}
