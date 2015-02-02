//
//  item.swift
//  Lista Spesa
//
//  Created by Gabriel Ciulei on 24/01/15.
//  Copyright (c) 2015 Kennedy. All rights reserved.
//

import Foundation

class Item {
    var name : String
    var count : Int
    
    init(name: String, count: Int)
    {
        self.name = name
        self.count = count
    }
}