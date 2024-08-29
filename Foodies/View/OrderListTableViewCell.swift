//
//  OrderListTableViewCell.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 03/05/24.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cuisineItemName: UILabel!
    
    @IBOutlet weak var cuisineItemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
