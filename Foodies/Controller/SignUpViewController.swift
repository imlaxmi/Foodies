//
//  SignUpViewController.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 01/07/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var signUpView: UIView!
    
    @IBOutlet weak var txtUserName: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signUpView.layer.cornerRadius = 20.0
    }
    
    @IBAction func btnSignUpClicked(_ sender: UIButton) {
    }
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
}
