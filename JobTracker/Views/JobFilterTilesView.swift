//
//  JobFilterTilesView.swift
//  JobTracker
//
//  Created by Christian on 1/18/22.
//

import Foundation
import UIKit

class JobFilterTilesView: UIView {
    
    // UI Properties
    
    let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        return stackView
    }()
    
    let openFilterTile: FilterTile = {
        let tile = FilterTile()
        tile.translatesAutoresizingMaskIntoConstraints = false
        tile.filterNameText = "open"
        tile.filterCount = 0
        tile.textColor = UIColor(named: "Sky")
        return tile
    }()
    
    let appliedFilterTile: FilterTile = {
        let tile = FilterTile()
        tile.translatesAutoresizingMaskIntoConstraints = false
        tile.filterNameText = "applied"
        tile.filterCount = 0
        tile.textColor = UIColor(named: "Moss")
        return tile
    }()
    
    let interviewFilterTile: FilterTile = {
        let tile = FilterTile()
        tile.translatesAutoresizingMaskIntoConstraints = false
        tile.filterNameText = "interview"
        tile.filterCount = 0
        tile.textColor = UIColor(named: "Peach")
        return tile
    }()
    
    let closedFilterTile: FilterTile = {
        let tile = FilterTile()
        tile.translatesAutoresizingMaskIntoConstraints = false
        tile.filterNameText = "closed"
        tile.filterCount = 0
        tile.textColor = UIColor(named: "Ash")
        return tile
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
    
    private func setUpUI() {
        stackView.addArrangedSubview(openFilterTile)
        stackView.addArrangedSubview(appliedFilterTile)
        stackView.addArrangedSubview(interviewFilterTile)
        stackView.addArrangedSubview(closedFilterTile)
        
        addSubview(stackView)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
