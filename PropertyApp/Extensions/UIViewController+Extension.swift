//
//  UIViewController+Extension.swift
//  PropertyApp
//
//  Created by Zaryab on 11/10/19.
//  Copyright © 2019 Zaryab. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    
    func showMessage(_ title: String, message: String) {
        let alertAction = UIAlertAction(title: title, style: .default, handler: nil)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true) {
        }
    }
    
    func showLoader() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
        
    func hideLoader() {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
}
