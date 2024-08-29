//
//  CuisineListViewController.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 03/05/24.
//

import UIKit

class CuisineListViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var cuisineName: UILabel!
    
    @IBOutlet weak var cartBtn: UIButton!
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var cuisine = cuisineCategory()
    
    var northIndianImgArr:[String] = ["butterchicken","dahibhalla","niharighost","stuffedbati","roganjosh"]
    var southIndianImgArr:[String] = ["chickenbiryani","chickenchettinad","coconutchutney","coorgigawatichicken","kadalacurry"]
    var mexicanImgArr:[String]=["chilaquiles","enchiladas","guacamole","mole","tacosalpastor"]
    var itallianImgArr:[String]=["gnocci","lasagne","pizza","risotto","pasta"]
    var chineseImgArr:[String]=["dumplings","kungpaochicken","mopotofu","springroll","sweetandsourpork"]
    
    var northIndianNameArr:[String] = ["Butter Chicken","Dahi Bhalla","Nihari Ghost","Stuffed Bati","Rogan Josh"]
    var southIndianNameArr:[String] = ["Chicken Biryani","Chicken Chettinad","Coconut Chutney","Coorgi Gawati Chicken","Kadala Curry"]
    var mexicanNameArr:[String]=["Chilaquiles","Enchiladas","Guacamole","Mole","Tacos al Pastor"]
    var itallianNameArr:[String]=["Gnocci","Lasagne","Pizza","Risotto","Pasta"]
    var chineseNameArr:[String]=["Dumplings","Kung Pao Chicken","Mo Po Tofu","Spring Roll","Sweet and Sour Pork"]
    
    var northIndianPriceArr:[String] = ["500","200","1000","200","1800"]
    var southIndianPriceArr:[String] = ["400","600","150","900","450"]
    var mexicanPriceArr:[String]=["750","450","200","400","650"]
    var itallianPriceArr:[String]=["800","700","300","600","400"]
    var chinesePriceArr:[String]=["300","350","400","200","400"]
    
    var currentImgArr: [String] = []
    var currentNameArr: [String] = []
    var currentPriceArr: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCuisine()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func cart(_ sender: Any) {
        
        if inCart.itemName.isEmpty{
            
            let emptycart = self.storyboard?.instantiateViewController(withIdentifier: "emptyCartViewController") as? emptyCartViewController
            
            self.navigationController?.pushViewController(emptycart!, animated: true)
            
        }
        else {
            
            let orders = self.storyboard?.instantiateViewController(withIdentifier: "OrderListViewController") as? OrderListViewController
            
            self.navigationController?.pushViewController(orders!, animated: true)
            
        }
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    func setupCuisine() {
            switch cuisineCategory.row {
            case 0:
                cuisineName.text = cuisineCategory.cuisineSelected
                currentImgArr = northIndianImgArr
                currentNameArr = northIndianNameArr
                currentPriceArr = northIndianPriceArr
            case 1:
                cuisineName.text = cuisineCategory.cuisineSelected
                currentImgArr = chineseImgArr
                currentNameArr = chineseNameArr
                currentPriceArr = chinesePriceArr
            case 2:
                cuisineName.text = cuisineCategory.cuisineSelected
                currentImgArr = mexicanImgArr
                currentNameArr = mexicanNameArr
                currentPriceArr = mexicanPriceArr
            case 3:
                cuisineName.text = cuisineCategory.cuisineSelected
                currentImgArr = southIndianImgArr
                currentNameArr = southIndianNameArr
                currentPriceArr = southIndianPriceArr
            case 4:
                cuisineName.text = cuisineCategory.cuisineSelected
                currentImgArr = itallianImgArr
                currentNameArr = itallianNameArr
                currentPriceArr = itallianPriceArr
            default:
                break
            }
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return currentImgArr.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cuisineListCell", for: indexPath) as! CuisineListTableViewCell
            cell.cuisineListDishImg.image = UIImage(named: currentImgArr[indexPath.row])
            cell.cuisineListDishName.text = currentNameArr[indexPath.row]
            cell.cuisineListDishPrice.text = currentPriceArr[indexPath.row]
            cell.cuisineListDishMultiple.tag = indexPath.row
            cell.noOfItems.tag = indexPath.row
            cell.delegate = self
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Add any selection handling here if needed
        }
    
}
extension CuisineListViewController: CuisineListTableViewCellDelegate {
    func didUpdateQuantity(for index: Int, quantity: Int) {
        let itemName = currentNameArr[index]
        let itemPrice = Int(currentPriceArr[index]) ?? 0
        
        if let existingIndex = inCart.itemName.firstIndex(of: itemName) {
            if quantity == 0 {
                inCart.itemName.remove(at: existingIndex)
                inCart.itemPrice.remove(at: existingIndex)
                inCart.noOfItems.remove(at: existingIndex)
            } else {
                inCart.noOfItems[existingIndex] = quantity
            }
        } else if quantity > 0 {
            inCart.itemName.append(itemName)
            inCart.itemPrice.append(itemPrice)
            inCart.noOfItems.append(quantity)
        }
    }
}
