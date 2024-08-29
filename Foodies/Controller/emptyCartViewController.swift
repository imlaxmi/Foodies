//
//  emptyCartViewController.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 03/05/24.
//

import UIKit

class emptyCartViewController: UIViewController {
    
    @IBOutlet weak var emptyCartImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func browse(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
  
}
