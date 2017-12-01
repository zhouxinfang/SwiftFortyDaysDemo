//
//  KHKeyframeAnimationController.swift
//  Project20BasicAnimation
//
//  Created by zhouxinfang on 2017/11/22.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class KHKeyframeAnimationController: UIViewController {
    var animatedView:UIView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "KeyframeAnimation"
        self.initrectView()
        self.keyFrameAniamte()
    }
    
    //初始化动画对象
    func initrectView()
    {
        let viewFrame = CGRect.init(x: 50, y: 50, width: 100, height: 100)
        animatedView = UIView.init(frame: viewFrame)
        animatedView.backgroundColor = UIColor.cyan
        animatedView.center = self.view.center
        self.view.addSubview(animatedView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func keyFrameAniamte()
    {
        let layer = self.animatedView.layer
        layer.cornerRadius = 5.0
        let keyAnimate = CAKeyframeAnimation(keyPath: "position")
        //3.设定关键帧
        
        let value0 = NSValue(cgPoint: layer.position)
        
        let value1 = NSValue(cgPoint: CGPoint.init(x: layer.position.x, y: layer.position.y + 200))
        
        let value2 = NSValue(cgPoint: CGPoint.init(x: layer.position.x - 150, y: layer.position.y + 200))
        
        let value3 = NSValue(cgPoint: CGPoint.init(x: layer.position.x - 150, y: layer.position.y))
        
        let value4 = NSValue(cgPoint: layer.position)
        
        keyAnimate.values = [value0, value1, value2, value3, value4]
        
        keyAnimate.autoreverses = false
        
        keyAnimate.repeatCount = MAXFLOAT
        
        keyAnimate.duration = 6.0
        
        layer.add(keyAnimate, forKey: "keyAnimate")
        
    }


}
