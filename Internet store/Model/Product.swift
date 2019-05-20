//
//  Product.swift
//  Internet store
//
//  Created by Damian on 27.08.2017.
//  Copyright © 2017 Damian. All rights reserved.
//

import Foundation

struct Product {
    private (set) public var id: String
    private (set) public var name: String
    private (set) public var description: String
    private (set) public var amount: String
    private (set) public var price: Int
    private (set) public var brand: String
    private (set) public var imagesList: [String]
    
    init(_id: String, _name: String, _description: String, _amount: String, _price: Int, _imagesList: [String], _brand: String){
        self.id = _id
        self.name = _name
        self.description = _description
        self.amount = _amount
        self.price = _price
        self.imagesList = _imagesList
        self.brand = _brand
    }
    
}
