//
//  CartViewController.swift
//  Internet store
//
//  Created by Damian on 29.01.2018.
//  Copyright © 2018 Damian. All rights reserved.
//

import UIKit

class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sumLbl: UILabel!
    var sum = 0
    let defaults = UserDefaults.standard
    var dict =  [String:Int]() // [Id:Amount]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Koszyk"
        
        if(defaults.object(forKey: "CartDictionary") != nil) {
            dict = defaults.object(forKey: "CartDictionary") as! [String:Int]
        }
        
        for i in Variables.items {
            sum += i.amount*i.price
        }
        
        sumLbl.text = "Razem: \(sum) PLN"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Variables.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as? CartCell{
            let item = Variables.items[indexPath.row]
            cell.updateViews(item: item)
            return cell
        }
        return CartCell()
    }


}
