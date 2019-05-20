//
//  CategoryCell.swift
//  Internet store
//
//  Created by Damian on 24.08.2017.
//  Copyright © 2017 Damian. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    func updateViews(category: Category) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.Title
    }

}
