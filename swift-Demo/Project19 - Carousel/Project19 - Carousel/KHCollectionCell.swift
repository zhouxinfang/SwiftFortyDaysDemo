//
//  KHCollectionCell.swift
//  Project19 - Carousel
//
//  Created by zhouxinfang on 2017/11/21.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class KHCollectionCell: UICollectionViewCell
{
    @IBOutlet weak var imageView: UIImageView!

    func updateImageView(image:UIImage)
    {
        imageView.image = image
    }
}
