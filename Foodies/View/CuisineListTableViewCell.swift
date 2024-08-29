//
//  CuisineListTableViewCell.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 03/05/24.
//

import UIKit

protocol CuisineListTableViewCellDelegate: AnyObject {
    func didUpdateQuantity(for index: Int, quantity: Int)
}

class CuisineListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cuisineListDishImg: UIImageView!
    
    @IBOutlet weak var cuisineListDishName: UILabel!
    
    @IBOutlet weak var cuisineListDishPrice: UILabel!
    
    @IBOutlet weak var cuisineListDishMultiple: UIStepper!
    
    @IBOutlet weak var noOfItems: UILabel!
    
    var CLVC = CuisineListViewController()
    weak var delegate: CuisineListTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        noOfItems.isHidden = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func stepperClick(_ sender: UIStepper) {
        
        noOfItems.text = String(Int(sender.value))
                noOfItems.isHidden = sender.value == 0
                
                // Update the cart
                if let itemName = cuisineListDishName.text, let itemPrice = Int(cuisineListDishPrice.text ?? "0") {
                    updateCart(itemName: itemName, itemPrice: itemPrice, itemCount: Int(sender.value))
                }
        
    }
    private func updateCart(itemName: String, itemPrice: Int, itemCount: Int) {
           if let index = inCart.itemName.firstIndex(of: itemName) {
               if itemCount == 0 {
                   inCart.itemName.remove(at: index)
                   inCart.itemPrice.remove(at: index)
                   inCart.noOfItems.remove(at: index)
               } else {
                   inCart.noOfItems[index] = itemCount
                   inCart.itemPrice[index] = itemPrice * itemCount
               }
           } else {
               if itemCount > 0 {
                   inCart.itemName.append(itemName)
                   inCart.itemPrice.append(itemPrice * itemCount)
                   inCart.noOfItems.append(itemCount)
               }
           }
       }
}
