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
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "Smoke")
        tableView.allowsSelection = false
        tableView.register(ChooseStatusTableViewCell.self, forCellReuseIdentifier: "ChooseStatusCell")
        tableView.register(EditFieldTableViewCell.self, forCellReuseIdentifier: "EditFieldCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        title = "Hellooooo people"
        
        tableView.dataSource = self
        tableView.delegate = self

        view.addSubview(tableView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension ChangeJobDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0) {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseStatusCell") as? ChooseStatusTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EditFieldCell") as? EditFieldTableViewCell else {
                return UITableViewCell()
            }
            switch indexPath.row {
            case 1:
                cell.fieldName = "company"
            case 2:
                cell.fieldName = "role"
            case 3:
                cell.fieldName = "team • organization"
            case 4:
                cell.fieldName = "📍 location"
            case 5:
                cell.fieldName = "link"
            case 6:
                cell.fieldName = "notes"
            default:
                cell.fieldName = ""
            }
            
            return cell
        }
    }
}

extension ChangeJobDetailsViewController: UITableViewDelegate {
    
}
