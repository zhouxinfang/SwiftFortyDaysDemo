//
//  ViewController.swift
//  Project18 - ImageTransition
//
//  Created by zhouxinfang on 2017/11/10.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image1 = UIImage.init(named: "1")
        let image11 = UIImage.init(named: "11")
        let image2 = UIImage.init(named: "2")
        let image22 = UIImage.init(named: "22")
        let image3 = UIImage.init(named: "3")
        let image33 = UIImage.init(named: "33")
        let image4 = UIImage.init(named: "4")
        let image44 = UIImage.init(named: "44")
        let image5 = UIImage.init(named: "5")
        let image55 = UIImage.init(named: "55")
        let image6 = UIImage.init(named: "6")
        let image66 = UIImage.init(named: "66")

        let thumbnailImages = [image1,image2,image3,image4,image5,image6]
        let fullImages = [image11,image22,image33,image44,image55,image66]

        
        let photoView = KHPhotoView.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 300), thumbnailImageArray: thumbnailImages as! Array<UIImage>, fullImageArray: fullImages as! Array<UIImage>)
        photoView.center = self.view.center
        photoView.reloadData()
        self.view.addSubview(photoView)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imageTouchEvent()
    {
        
    }
}

