//
//  KHShop.swift
//  Project21 - WaterFall
//
//  Created by zhouxinfang on 2017/11/30.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

struct KHShop
{
    var height = 0.0
    var width = 0.0
    var image:NSString = ""
    var price:NSString = ""
    
    
    init(dictionary:NSDictionary)
    {
        let imageValue = dictionary.object(forKey: "img")
        if let imageValue = imageValue
        {
            self.image = imageValue as! NSString
        }
        let price = dictionary.object(forKey: "price")
        if let priceValue = price
        {
            self.price = priceValue as! NSString
        }
        let h = dictionary.object(forKey: "h")
        if let h = h
        {
            self.height = Double(h as! Float)
        }
        let w = dictionary.object(forKey: "w")
        if let w = w
        {
            self.width = Double(w as! Float)
        }

    }
}

