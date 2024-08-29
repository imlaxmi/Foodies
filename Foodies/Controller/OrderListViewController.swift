//
//  OrderListViewController.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 03/05/24.
//

import UIKit

class OrderListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var cuisineName: UILabel!
    
    @IBOutlet weak var netAmount: UILabel!
    
    @IBOutlet weak var cgst: UILabel!
    
    @IBOutlet weak var sgst: UILabel!
    
    @IBOutlet weak var grandTotal: UILabel!
    
    @IBOutlet weak var btnPlaceOrder: UIButton!
    
    @IBOutlet weak var btnBack: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculation()
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func calculation(){
        var amt = 0
               for i in 0..<inCart.itemPrice.count {
                   amt += inCart.noOfItems[i] * inCart.itemPrice[i]
               }
               
               let Cgst = (2.5 * Double(amt)) / 100
               let Sgst = (2.5 * Double(amt)) / 100
               let GrandTotal = Double(amt) + Cgst + Sgst
               
               netAmount.text = String(format: "%.2f", Double(amt))
               cgst.text = String(format: "%.2f", Cgst)
               sgst.text = String(format: "%.2f", Sgst)
               grandTotal.text = String(format: "%.2f", GrandTotal)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return inCart.itemName.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListCell") as! OrderListTableViewCell

        cell.cuisineItemName.text = inCart.itemName[indexPath.row]
                let itemPrice = inCart.noOfItems[indexPath.row] * inCart.itemPrice[indexPath.row]
                cell.cuisineItemPrice.text = String(format: "%.2f", Double(itemPrice))
                return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
