//
//  ChangeJobDetailsViewController.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 11/1/21.
//

import UIKit

enum EditMode {
    case add, edit
}

class ChangeJobDetailsViewController: UIViewController {
    
    let editMode: EditMode
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let companyNameField: EditFieldView = {
        let editFieldView = EditFieldView()
        editFieldView.fieldName = "company"
        editFieldView.translatesAutoresizingMaskIntoConstraints = false
        return editFieldView
    }()
    
    private let roleField: EditFieldView = {
        let editFieldView = EditFieldView()
        editFieldView.fieldName = "role"
        editFieldView.translatesAutoresizingMaskIntoConstraints = false
        return editFieldView
    }()
    
    private let teamField: EditFieldView = {
        let editFieldView = EditFieldView()
        editFieldView.fieldName = "team • organization"
        editFieldView.translatesAutoresizingMaskIntoConstraints = false
        return editFieldView
    }()
    
    private let locationField: EditFieldView = {
        let editFieldView = EditFieldView()
        editFieldView.fieldName = "📍 location"
        editFieldView.translatesAutoresizingMaskIntoConstraints = false
        return editFieldView
    }()
    
    private let linkField: EditFieldView = {
        let editFieldView = EditFieldView()
        editFieldView.fieldName = "link"
        editFieldView.translatesAutoresizingMaskIntoConstraints = false
        return editFieldView
    }()
    
    private let notesField: EditFieldView = {
        let editFieldView = EditFieldView()
        editFieldView.fieldName = "notes"
        editFieldView.translatesAutoresizingMaskIntoConstraints = false
        return editFieldView
    }()

    
    init(withEditMode editMode: EditMode) {
        self.editMode = editMode
        
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
        activateConstraints()
    }
        
    required init?(coder: NSCoder) {
        self.editMode = .add
        
        super.init(coder: coder)
        
        setupUI()
        activateConstraints()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "Smoke")
        title = editMode == .add ? "Add a new job" : "Edit job details"

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named:"Rose")

        stackView.addArrangedSubview(companyNameField)
        stackView.addArrangedSubview(roleField)
        stackView.addArrangedSubview(teamField)
        stackView.addArrangedSubview(locationField)
        stackView.addArrangedSubview(linkField)
        stackView.addArrangedSubview(notesField)
        
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
    }
        
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            companyNameField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            roleField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            teamField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            locationField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            linkField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            notesField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
        ])
        
        stackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        companyNameField.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
    }
    
    @objc private func didTapSave() {
        print("save details to coredata, ideally")
        dismiss(animated: true, completion: nil)
    }
}
