//
//  Food.swift
//  Gigapet
//
//  Created by Alex on 5/20/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation

struct Food: Equatable {
    var foodName: String
    var calorieCount: Int
    var category: Category
    var date: Date
}

enum Category {
    case dairy
    case vegatables
    case fruits
    case grains
    case proteins
    case junk
}
