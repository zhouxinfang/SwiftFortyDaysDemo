//
//  KHPhotoView.swift
//  Project18 - ImageTransition
//
//  Created by zhouxinfang on 2017/11/17.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class KHPhotoView: UIScrollView,KHPhotoImageViewDelegate{
    
    var thumbnailImages:Array<UIImage>

    let fullImages:Array<UIImage>

    var photoMargin:CGFloat = 5.0
    
    
    lazy var keywindow: UIWindow =
        {
            let keywindow = UIWindow.init(frame: UIScreen.main.bounds)
            return keywindow
    }()
    
    var photoHeight:CGFloat = 70.0
    
    var photoWidth:CGFloat = 70.0
    
    let maxPhotos:Int = 9
    let maxPhotosInRow:Int = 3

    
    lazy var photoImageViews:NSMutableArray =
        {
            let array = NSMutableArray()
            return array
    }()


    
    init(frame:CGRect,thumbnailImageArray:Array<UIImage>, fullImageArray:Array<UIImage>)
    {
        thumbnailImages = thumbnailImageArray
        fullImages = fullImageArray
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData()
    {
        //判断图片数量是否大于最大允许的图片数量
        if thumbnailImages.count > maxPhotos
        {
            let thumbnailImage:NSMutableArray = NSMutableArray.init(array: thumbnailImages)
            thumbnailImages = thumbnailImage.subarray(with: NSRange.init(location: 0, length: maxPhotos)) as! Array<UIImage>
        }
        
        for index in 0..<thumbnailImages.count
        {
            let image = thumbnailImages[index]
            let photoImageView = KHPhotoImageView.init(index: index, image: image)
            photoImageView.delegate = self
            self.photoImageViews.add(photoImageView)
            self.addSubview(photoImageView)
        }
        self.layoutSubview()
    }
    
    func layoutSubview()
    {
        self.contentInset = UIEdgeInsets.zero
        let photoCount = self.photoImageViews.count
        if photoCount == 1
        {
            let photoImageView:KHPhotoImageView = photoImageViews[0] as! KHPhotoImageView;
            photoImageView.frame = self.bounds
            self.contentSize = self.bounds.size;
            return
        }
        for index in 0..<photoImageViews.count
        {
            let col = index % maxPhotosInRow;
            let row = index / maxPhotosInRow;
            
            let y = CGFloat(row) * (self.photoHeight + self.photoMargin);
            let x = CGFloat(col) * (self.photoWidth + self.photoMargin);
            
            let photoImageView:KHPhotoImageView = photoImageViews[index] as! KHPhotoImageView;
            photoImageView.frame = CGRect.init(x: x, y: y, width: photoWidth, height: photoHeight)
        }
    }
    
    func imageViewDidTapped(imageView:KHPhotoImageView)
    {
        let index = photoImageViews.index(of: imageView)
        if index >= 0 && index < photoImageViews.count
        {
            let viewController:KHPhotoCollectionController = KHPhotoCollectionController.init(imageList: self.fullImages, index: index,imageViewList:self.photoImageViews as! Array<UIImageView>)
            viewController.showInWindow()
        }
    }
}
