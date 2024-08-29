//
//  Extension.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 17/07/24.
//

import Foundation
import UIKit

extension UIApplication {
    var currentApplicationVersion:String {
        if let versionApp = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return versionApp
        }
        return "2.4.1"
    }
}
