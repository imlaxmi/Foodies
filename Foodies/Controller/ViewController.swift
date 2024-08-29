//
//  ViewController.swift
//  Foodies
//
//  Created by Yusata Infotech Pvt Ltd on 02/05/24.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var cusineImgArr:[String]=["NothIndianImg","Chinese","Mexican","SouthIndian","itallian"]
    var cusineNameArr:[String]=["NorthIndian","Chinese","Mexican","SouthIndian","Italian"]
    
    // Popular dishes data
        var popularDishImages: [String] = ["dish1", "dish2", "dish3"]
        var popularDishNames: [String] = ["Dish 1", "Dish 2", "Dish 3"]
        var popularDishPrices: [Double] = [10.99, 12.99, 9.99]
        var popularDishRatings: [Double] = [4.5, 4.0, 4.7]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cusineImgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CuisineCell", for: indexPath) as! MyCollectionViewCell
        
        cell.myCousinListImg.image = UIImage(named: cusineImgArr[indexPath.row])
        cell.cuisineLbl.text = cusineNameArr[indexPath.row]
        
        cell.layer.cornerRadius = 20
        cell.myCousinListImg.layer.cornerRadius = 20
        cell.myCousinListImg.alpha=0.9
        
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            cuisineCategory.row = indexPath.row
            cuisineCategory.cuisineSelected = cusineNameArr[indexPath.row]
            navigate() // Call the navigate function when a cuisine is selected
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return popularDishNames.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PopularItemCell", for: indexPath) as! PopularItemCell
            cell.popItemImg.image = UIImage(named: popularDishImages[indexPath.row])
            cell.popItemName.text = popularDishNames[indexPath.row]
            cell.popItemPrice.text = String(format: "$%.2f", popularDishPrices[indexPath.row])
            cell.popIttemRating.text = String(format: "%.1f", popularDishRatings[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func navigate(){
        
        let cuisineList = self.storyboard?.instantiateViewController(withIdentifier: "CuisineListViewController") as? CuisineListViewController
        self.navigationController?.pushViewController(cuisineList!, animated: true)
        
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
    
}

