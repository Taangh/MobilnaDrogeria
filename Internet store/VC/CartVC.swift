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
        updatePriceLbl()
    }
    
    func updatePriceLbl() {
        sum = 0
        for i in Variables.items {
            sum += i.amount*i.price
        }
        print(sum)
        sumLbl.text = "Razem: \(sum) PLN"

    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            Variables.items.remove(at: indexPath.row)
            updatePriceLbl()
            tableView.reloadData()
            // handle delete (by removing the data from your array and updating the tableview)
        }
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
            cell.minutBtn.tag = indexPath.row
            cell.minutBtn.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)

            cell.plusBtn.tag = indexPath.row
            cell.plusBtn.addTarget(self, action: #selector(subscribeTapped(_:)), for: .touchUpInside)

            return cell
        }
        return CartCell()
    }
    
    @objc func subscribeTapped(_ sender: UIButton){
       updatePriceLbl()
    }
    
    @IBAction func OrderBtnClick(sender _: UIButton) {
        if Variables.items.count > 0 {
            performSegue(withIdentifier: "CartVCAdressVC", sender: nil)
        }
    }


}
