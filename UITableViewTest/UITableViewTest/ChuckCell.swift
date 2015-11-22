//
//  CustomCell.swift
//  UITableViewTest
//
//  Created by chuck chan on 15/11/22.
//  Copyright © 2015年 chuck chan. All rights reserved.
//

import Foundation
import UIKit

class ChuckCell:UITableViewCell{
    
    @IBOutlet weak var showImageView: UIImageView!
    
    @IBOutlet weak var showNameLabel: UILabel!
    
    @IBOutlet weak var showStatusLabel: UILabel!
    
    @IBOutlet weak var showTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
