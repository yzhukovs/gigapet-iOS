//
//  FoodTableViewCell.swift
//  Gigapet
//
//  Created by Alex on 5/20/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet var foodNameLbl: UILabel!
    @IBOutlet var calorieLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
