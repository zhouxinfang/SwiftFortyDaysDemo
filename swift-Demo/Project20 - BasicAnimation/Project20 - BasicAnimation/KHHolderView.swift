//
//  KHHolderView.swift
//  Project20BasicAnimation
//
//  Created by zhouxinfang on 2017/11/22.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class KHHolderView: UIView {

    let ovalLayer = KHOvalLayer()
    let triangleLayer = KHTriangleLayer()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        self.startAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func startAnimation()
    {
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(KHHolderView.wobbleOval), userInfo: nil, repeats: false)
    }
    
    
    @objc func wobbleOval() {
        ovalLayer.wobble()
        ovalLayer.addSublayer(triangleLayer) // Add this line
        ovalLayer.wobble()
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(KHHolderView.drawAnimatedTriangle), userInfo: nil, repeats: false)
        
    }
    
    @objc func drawAnimatedTriangle()
    {
        triangleLayer.animate()
        Timer.scheduledTimer(timeInterval:0.9, target: self, selector:#selector(KHHolderView.spinAndTransform),
                             userInfo: nil, repeats: false)
    }
    
    
    
    
    @objc func spinAndTransform()
    {
        layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.6)
        let rotationAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(M_PI * 2.0)
        rotationAnimation.duration = 0.45
        rotationAnimation.isRemovedOnCompletion = true
        layer.add(rotationAnimation, forKey: nil)
        
        ovalLayer.contract()

    }

}
