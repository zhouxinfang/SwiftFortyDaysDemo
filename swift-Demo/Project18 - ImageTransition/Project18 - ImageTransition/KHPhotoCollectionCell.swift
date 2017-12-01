//
//  KHPhotoCollectionCell.swift
//  Project18 - ImageTransition
//
//  Created by zhouxinfang on 2017/11/17.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class KHPhotoCollectionCell: UICollectionViewCell {
    
    let scrollView:UIScrollView
    
    lazy var photoImageView:KHPhotoImageView =
        {
            let imageView = KHPhotoImageView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
            self.scrollView.addSubview(imageView)
            return imageView
    }()

    
    override init(frame: CGRect)
    {
        print("KHPhotoCollectionCell init")
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
//        scrollView.showsVerticalScrollIndicator = false
//        scrollView.showsHorizontalScrollIndicator = false
        super.init(frame: frame)
        self.contentView.addSubview(scrollView)
    }
    
    func setImage(image:UIImage,index:NSInteger)
    {
        let imageSize = image.size
        self.photoImageView.image = image
        self.photoImageView.imageIndex = index

//        self.photoImageView.frame = CGRect.init(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
//        self.scrollView.contentSize = CGSize.init(width: self.bounds.size.width, height: imageSize.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   
}
