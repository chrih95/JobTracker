//
//  JobsView.swift
//  JobTracker
//
//  Created by Christian on 1/20/22.
//

import Foundation
import UIKit

class JobsView: UIView {
    
    // MARK: - UI Properties
    
    let filterView: FavoritesFilterView = {
       let filter = FavoritesFilterView()
        filter.translatesAutoresizingMaskIntoConstraints = false
        return filter
    }()
}
