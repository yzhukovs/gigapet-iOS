//
//  Food.swift
//  Gigapet
//
//  Created by Alex on 5/20/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation

struct Food: Codable {
    var foodName: String
    var foodType: Category
    var calories: String
    var date: String
    var parentId: String
    var childId: String

}

enum Category: String, Codable {
    case dairy
    case vegatables
    case fruits
    case grains
    case proteins
    case junk
}


