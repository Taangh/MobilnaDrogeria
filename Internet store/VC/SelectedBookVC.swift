//
//  SelectedBookVC.swift
//  Internet store
//
//  Created by Damian on 27.01.2018.
//  Copyright © 2018 Damian. All rights reserved.
//

import UIKit

class SelectedBookVC: UIViewController {

    @IBOutlet weak var amontTxtField: UITextField!
    @IBOutlet weak var minutAmount: UIButton!
    var amount : Int = 1
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    var test: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amontTxtField.isUserInteractionEnabled = false;
        amontTxtField.text = "\(amount)"
        minutAmount.isEnabled = false

    }
    
    func initSelected(book: Book) {
        navigationItem.title = book.title
        author.text = book.author
        price.text = book.price
        titleLbl.text = book.title
        cover.image = UIImage(named: book.imageName)
        
    }

    @IBAction func decreaseAmount(_ sender: Any) {
        if(amount > 1) {
            amount -= 1
            if(amount == 1) {
                minutAmount.isEnabled = false
            }
        }
        amontTxtField.text = "\(amount)"
    }
    
    @IBAction func increaseAmount(_ sender: Any) {
        amount += 1
        minutAmount.isEnabled = true
        amontTxtField.text = "\(amount)"

    }
}
