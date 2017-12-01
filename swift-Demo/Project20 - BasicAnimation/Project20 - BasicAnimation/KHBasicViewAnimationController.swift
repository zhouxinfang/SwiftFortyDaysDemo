//
//  KHBasicViewAnimationController.swift
//  Project20 - BasicAnimation
//
//  Created by zhouxinfang on 2017/11/21.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class KHBasicViewAnimationController: UIViewController {

    var animatedView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "CABasicAnimation"
        self.initrectView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //初始化动画对象
    func initrectView()
    {
        let viewFrame = CGRect.init(x: 50, y: 50, width: 100, height: 100)
        animatedView = UIView.init(frame: viewFrame)
        animatedView.backgroundColor = UIColor.cyan
        animatedView.center = self.view.center
        self.view.addSubview(animatedView)
        
        let barButtonItem = UIBarButtonItem.init(title: "下一个", style: UIBarButtonItemStyle.plain, target: self, action: #selector(KHBasicViewAnimationController.nextAnimationButtonDidClick))
        self.navigationItem.rightBarButtonItem = barButtonItem
        
    }
    
    func resumeAnimatedView()
    {
        animatedView.transform = CGAffineTransform.identity
    }
    
    var index:Int = 0
    
    @objc func nextAnimationButtonDidClick()
    {
        switch index%5
        {
        case 0:
            scaleAnimation()
        case 1:
            translationAnimation()
        case 2:
            rotationAnimation()
        case 3:
            changeColorAnimation()
        case 4:
            springAnimation()
        case 5:
            groupAnimation()
        default: break
        }
        index += 1
    }
    
    //缩放动画
    func scaleAnimation()
    {
        UIView.animate(withDuration: 3, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations:
            {
            self.animatedView.transform = CGAffineTransform.init(scaleX: 2, y: 2)
        }, completion: { (bool) in
            self.resumeAnimatedView()
        })
    }
    
    //位移动画
    func translationAnimation()
    {
        UIView.animate(withDuration: 3, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations:
            {
                self.animatedView.transform = CGAffineTransform.init(translationX: 100, y: 100)
        }, completion: { (bool) in
            self.resumeAnimatedView()
        })
    }

    
    //旋转动画
    func rotationAnimation()
    {
        UIView.animate(withDuration: 3, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations:
            {
                self.animatedView.transform = CGAffineTransform.init(rotationAngle: CGFloat(M_PI))
        }, completion: { (bool) in
            self.resumeAnimatedView()
        })
    }
    
    //改变颜色动画
    func changeColorAnimation()
    {
        UIView.animate(withDuration: 3, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations:
            {
                self.animatedView.backgroundColor = UIColor.red
        }, completion: { (bool) in
            self.resumeAnimatedView()
        })
    }
    
    //弹簧动画
    func springAnimation()
    {
        let damping:CGFloat = 0.3 //阻尼，越大越有黏度
        let velocity:CGFloat = 0.1 //初速度
        UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: UIViewAnimationOptions.curveEaseInOut, animations:
            {
                self.animatedView.transform = CGAffineTransform.init(translationX: 100, y: 100)
                
        }) { (finished) in
            self.resumeAnimatedView()
            
        }
    }
    
    func groupAnimation()
    {
        UIView.animate(withDuration: 3, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations:
            {
                
                let animation1 = CGAffineTransform.init(rotationAngle: CGFloat(M_PI))
                let animation2 = CGAffineTransform.init(scaleX: 2, y: 2)
                animation1.concatenating(animation2)

                self.animatedView.backgroundColor = UIColor.cyan
                self.animatedView.transform = animation1
        }, completion: { (bool) in
            self.resumeAnimatedView()
        })
    }


}
