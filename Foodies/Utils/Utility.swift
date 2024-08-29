//
//  Utility.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 02/07/24.
//

import Foundation
import UIKit

class Utility {
    
    // Example static method to show an alert
    static func showAlert(on viewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
}
