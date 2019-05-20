//
//  CartCell.swift
//  Internet store
//
//  Created by Damian on 29.01.2018.
//  Copyright © 2018 Damian. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet weak var minutBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var amountLbl: UITextField!
    @IBOutlet weak var imageImg: UIImageView!
    var amount : Int = 1
    var price : Int = 1

    @IBOutlet weak var priceLbl: UILabel!
    func updateViews(item: Item) {
        amount = item.amount
        price = item.price
        titleLbl.text = item.title
        amountLbl.text = "\(item.amount)"
        priceLbl.text = "\(item.price*item.amount) PLN"
        imageImg.image = UIImage(named: item.image)
    }

    @IBAction func minutBtn(_ sender: Any) {
        if(amount > 1) {
            amount -= 1
            amountLbl.text = "\(amount)"
            priceLbl.text = "\(price*amount) PLN"

        }
    }
    
    @IBAction func plusMinut(_ sender: Any) {
        amount += 1
        amountLbl.text = "\(amount)"
        priceLbl.text = "\(price*amount) PLN"

    }
}
