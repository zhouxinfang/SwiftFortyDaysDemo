//
//  KHBasicAnimationController.swift
//  Project20BasicAnimation
//
//  Created by zhouxinfang on 2017/11/22.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class KHBasicAnimationController: UIViewController {

    var animatedView:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "CABasicAnimation"
        self.initrectView()
        // Do any additional setup after loading the view.
    }
    
    
    //初始化动画对象
    func initrectView()
    {
        let viewFrame = CGRect.init(x: 50, y: 50, width: 100, height: 100)
        animatedView = UIView.init(frame: viewFrame)
        animatedView.backgroundColor = UIColor.cyan
        animatedView.center = self.view.center
        self.view.addSubview(animatedView)
        
        let barButtonItem = UIBarButtonItem.init(title: "下一个", style: UIBarButtonItemStyle.plain, target: self, action: #selector(KHBasicAnimationController.nextAnimationButtonDidClick))
        self.navigationItem.rightBarButtonItem = barButtonItem
        
    }
    
    var index:Int = 0
    
    @objc func nextAnimationButtonDidClick()
    {
        switch index%3
        {
        case 0:
            addLayerAnimationPosition()
        case 1:
            addLayerAnimationOpacity()
        case 2:
            addLayerAnimationBounds()
        case 3:
            addLayerAnimationTranformRotationX()
//        case 4:
//            springAnimation()
//        case 5:
//            groupAnimation()
        default: break
        }
        index += 1
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //移动动画position
    func addLayerAnimationPosition()
    {
        let layer = self.animatedView.layer
        let animation = CABasicAnimation(keyPath: "position")
        //开始的位置
        animation.fromValue = NSValue.init(cgPoint: layer.position)
        //移动到的位置
        animation.toValue = NSValue.init(cgPoint: CGPoint.init(x: 120.0, y: 120.0))
        //持续时间
        animation.duration = 3
        //运动后的位置保持不变（layer的最后位置是toValue）
        animation.isRemovedOnCompletion = true
        animation.fillMode = kCAFillModeForwards
        //添加动画
        layer.add(animation, forKey: "addLayerAnimationPosition")
    }
    
    //透明度 opacity
    func addLayerAnimationOpacity()
    {
        let layer = self.animatedView.layer
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 3
        animation.isRemovedOnCompletion = true
        layer.add(animation, forKey: "addLayerAnimationOpacity")
    }
    
    //变大与位置 bounds
    func addLayerAnimationBounds()
    {
        let layer = self.animatedView.layer
        let animation = CABasicAnimation(keyPath: "bounds")
        animation.toValue = NSValue(cgRect:CGRect.init(x: 130.0, y: 200.0, width: 140.0, height: 140.0))

        animation.duration = 3
        animation.repeatCount = 1
        animation.isRemovedOnCompletion = true
        layer.add(animation, forKey: "addLayerAnimationBounds")
    }
    
    //旋转动画(翻转，沿着X轴) transform.rotation.x
    func addLayerAnimationTranformRotationX()
    {
        let layer = self.animatedView.layer
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        //旋转180度 = PI
        animation.toValue = M_PI
        animation.duration = 3
        animation.repeatCount = 2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        layer.add(animation, forKey: "addLayerAnimationTranformRotationX")
    }
}
