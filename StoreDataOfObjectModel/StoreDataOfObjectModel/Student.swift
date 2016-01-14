//
//  Student.swift
//  StoreDataOfObjectModel
//
//  Created by chuck chan on 16/1/14.
//  Copyright © 2016年 chuck chan. All rights reserved.
//

import Foundation
import UIKit

class Student:NSObject , NSCoding{
    
    var name = ""
    var image:UIImage!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as! String
        let data:NSData = aDecoder.decodeObjectForKey("logo") as! NSData
        image = UIImage(data: data)
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
        var data = UIImagePNGRepresentation(image)
        aCoder.encodeObject(data, forKey: "logo")
    }
}
