//
//  HomeViewController.swift
//  JobTracker
//
//  Created by Christian on 1/18/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Properties
    
    let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        return stackView
    }()
    
    let topStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    let filterTiles: JobFilterTilesView = {
       let filterTiles = JobFilterTilesView()
        filterTiles.translatesAutoresizingMaskIntoConstraints = false
        return filterTiles
    }()
    
    let profileHeaderView: ProfileHeaderView = {
       let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addJobButton: AddJobButtonView = {
        let addJobView = AddJobButtonView()
        addJobView.translatesAutoresizingMaskIntoConstraints = false
        return addJobView
    }()
    
    let jobsView: JobsView = {
        let view = JobsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: - Initializers
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        setUpUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Set Up UI
    
    private func setUpUI() {
        view.backgroundColor = .white
        
        topStackView.addArrangedSubview(profileHeaderView)
        topStackView.addArrangedSubview(addJobButton)
        
        headerStackView.addArrangedSubview(topStackView)
        headerStackView.addArrangedSubview(filterTiles)
        
        view.addSubview(headerStackView)
        view.addSubview(jobsView)
        
        addJobButton.delegate = self
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            jobsView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 20),
            jobsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            jobsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            jobsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
}

extension HomeViewController: AddButtonDelegate {
    
    func addJob() {
        let addJobViewController = ChangeJobViewController(withEditMode: .add)
        let navigationController = UINavigationController.init(rootViewController: addJobViewController)
        
        navigationController.navigationBar.prefersLargeTitles = true
        
        present(navigationController, animated: true, completion: nil)
    }
}
