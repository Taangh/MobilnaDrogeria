//
//  ProductCellCollectionViewCell.swift
//  Internet store
//
//  Created by Damian on 27.08.2017.
//  Copyright © 2017 Damian. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Price: UILabel!
    @IBOutlet weak var Amount: UILabel!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Brand: UILabel!
    
    func updateViews(product: Product) {
        Name.text = product.name
        Image.image = UIImage(named: product.imagesList[0])
        Amount.text = product.amount
        Price.text = "\(product.price) PLN"
        Brand.text = "\(product.brand)"
    }
    
}
