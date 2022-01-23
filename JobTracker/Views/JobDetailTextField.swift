//
//  JobDetailTextField.swift
//  JobTracker
//
//  Created by Christian on 1/23/22.
//

import Foundation
import UIKit

class JobDetailTextField: UITextField {
    var padding = UIEdgeInsets(
    top: 10, left: 10, bottom: 10, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        
        return rect.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        
        return rect.inset(by: padding)
    }
}
