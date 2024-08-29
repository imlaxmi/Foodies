//
//  LoginViewController.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 01/07/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginView.layer.cornerRadius = 20.0
    }
   
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        if txtUserName.text != "" && txtPassword.text != "" {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let mainViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
                self.navigationController?.pushViewController(mainViewController, animated: true)
            }
        } else {
            Utility.showAlert(on: self, title: "Foodies", message: "Please enter all the credentials")
        }
    
    }
    
    @IBAction func btnSignUpClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let mainViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
                    self.navigationController?.pushViewController(mainViewController, animated: true)
                }
    }
   
}
