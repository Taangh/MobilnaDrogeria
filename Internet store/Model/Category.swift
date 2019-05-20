//
//  File.swift
//  Internet store
//
//  Created by Damian on 24.08.2017.
//  Copyright © 2017 Damian. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var Title: String
    private(set) public var imageName: String
    
    init(Title: String, imageName: String) {
        self.Title = Title
        self.imageName = imageName
    }
}
