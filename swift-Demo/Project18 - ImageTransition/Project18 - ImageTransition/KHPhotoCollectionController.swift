//
//  KHPhotoCollectionController.swift
//  Project18 - ImageTransition
//
//  Created by zhouxinfang on 2017/11/17.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "KHPhotoCollectionCellIdentifier"

class KHPhotoCollectionController: UICollectionViewController ,UICollectionViewDelegateFlowLayout{

    var images:Array<UIImage> = []
    
    var imagesViews:Array<UIImageView> = []

    var selectedIndex = 0
    
    lazy var keywindow: UIWindow =
        {
            let keywindow = UIWindow.init(frame: UIScreen.main.bounds)
            return keywindow
    }()
    
    init(imageList:Array<UIImage>,index:NSInteger,imageViewList:Array<UIImageView>)
    {
        let layout =  UICollectionViewFlowLayout.init()
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0;
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal;
        images = imageList
        selectedIndex = index
        imagesViews = imageViewList
        super.init(collectionViewLayout: layout)
        NotificationCenter.default.addObserver(self, selector: #selector(KHPhotoCollectionController.imageViewDidTappedNotification), name: NSNotification.Name(KHPhotoDidTappedNotification), object: nil)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.collectionView!.register(KHPhotoCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.isPagingEnabled = true;
        if selectedIndex < images.count
        {
            self.collectionView?.contentOffset = CGPoint(x: CGFloat(selectedIndex)*UIScreen.main.bounds.size.width, y: 0.0);
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell:KHPhotoCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! KHPhotoCollectionCell

        let row = indexPath.row
        if row >= 0 && row < images.count
        {
            let image = images[row]
            cell.setImage(image: image ,index: indexPath.row)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize.init(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets.zero;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
    {
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.zero

    }
    
    func showInWindow()
    {
        self.keywindow.rootViewController = self
        self.keywindow.makeKeyAndVisible()
        self.view.alpha = 0.0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6)
        {
            let cell:KHPhotoCollectionCell = self.collectionView?.visibleCells[0] as! KHPhotoCollectionCell
            if self.selectedIndex >= 0 && self.selectedIndex < self.imagesViews.count
            {
                let imageView = self.imagesViews[self.selectedIndex]
                let convertedFrame = self.view.convert(imageView.frame, from: imageView.superview)
                cell.photoImageView.frame = convertedFrame
                self.view.alpha = 1.0
                [UIView .animate(withDuration: 0.3, animations:
                    {
                        cell.photoImageView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width , height: UIScreen.main.bounds.size.height)
                }, completion: { (finished) in
                    
                })]
                
            }
            
        }
    }
    
    
    @objc func imageViewDidTappedNotification(notification:NSNotification)
    {
        let imageView = notification.object as! KHPhotoImageView
        let index = imageView.imageIndex
        if index >= 0 && index < self.imagesViews.count
        {
            let aidImageView = self.imagesViews[index]
            let cell:KHPhotoCollectionCell = self.collectionView?.visibleCells[0] as! KHPhotoCollectionCell
            let convertedFrame = self.view.convert(aidImageView.frame, from: aidImageView.superview)
            [UIView .animate(withDuration: 0.3, animations:
                {
                    cell.photoImageView.frame = convertedFrame
            }, completion: { (finished) in
                self.keywindow.rootViewController = nil
                self.keywindow.removeFromSuperview()
                UIApplication.shared.keyWindow?.makeKeyAndVisible()
            })]
           
        }
    }
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
