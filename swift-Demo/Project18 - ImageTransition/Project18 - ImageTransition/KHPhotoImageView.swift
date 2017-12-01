//
//  KHPhotoImageView.swift
//  Project18 - ImageTransition
//
//  Created by zhouxinfang on 2017/11/17.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

protocol KHPhotoImageViewDelegate
{
    func imageViewDidTapped(imageView:KHPhotoImageView)
}

class KHPhotoImageView: UIImageView
{
    var imageIndex:Int = 0

    var delegate:KHPhotoImageViewDelegate?
    
    init(index:Int,image:UIImage)
    {
        super.init(image: image)
        self.isUserInteractionEnabled = true
        imageIndex = index
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(KHPhotoImageView.imageViewDidTapped))
        self.addGestureRecognizer(tapGesture)
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(KHPhotoImageView.imageViewDidTapped))
        self.addGestureRecognizer(tapGesture)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func imageViewDidTapped()
    {
        if let delegate = delegate
        {
            delegate.imageViewDidTapped(imageView: self)
        }
        else
        {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: KHPhotoDidTappedNotification), object: self, userInfo: nil)
        }
    }
}
