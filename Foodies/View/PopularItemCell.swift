//
//  PopularItemCell.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 18/06/24.
//

import UIKit

class PopularItemCell: UITableViewCell {
    
    @IBOutlet weak var popItemImg: UIImageView!
    @IBOutlet weak var popItemName: UILabel!
    @IBOutlet weak var popItemPrice: UILabel!
    @IBOutlet weak var popIttemRating: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
