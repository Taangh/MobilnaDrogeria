//
//  Item.swift
//  Internet store
//
//  Created by Damian on 29.01.2018.
//  Copyright © 2018 Damian. All rights reserved.
//

import Foundation

struct Item {
    private (set) public var title : String
    private (set) public var amount : Int
    private (set) public var price : Int
    private (set) public var image : String
    
    init(title: String, amount: Int, price: Int, image: String) {
        self.title = title
        self.amount = amount
        self.price = price
        self.image = image
    }
    
    mutating func SetAmount(_amount: Int) {
        self.amount += _amount
    }
}
