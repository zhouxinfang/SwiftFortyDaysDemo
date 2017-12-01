//
//  ViewController.swift
//  Project04 - RandomGradientColor
//
//  Created by zhouxinfang on 2017/10/19.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let gradientLayer = CAGradientLayer()
    
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playMusicButtonDidTouch(sender: AnyObject)
    {
        
        if (timer == nil)
        {
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
        }
        
        gradientLayer.frame = view.bounds

        self.view.layer.addSublayer(gradientLayer)
    }
    
    @objc func randomColor() {
        
        let redValue1 = CGFloat(drand48())
        let blueValue1 =  CGFloat(drand48())
        let greenValue1 = CGFloat(drand48())
        let alpha1 = CGFloat(drand48())

        let redValue2 = CGFloat(drand48())
        let blueValue2 =  CGFloat(drand48())
        let greenValue2 = CGFloat(drand48())
        let alpha2 = CGFloat(drand48())
        
        let redValue3 = CGFloat(drand48())
        let blueValue3 =  CGFloat(drand48())
        let greenValue3 = CGFloat(drand48())
        let alpha3 = CGFloat(drand48())
        
        
        let redValue4 = CGFloat(drand48())
        let blueValue4 =  CGFloat(drand48())
        let greenValue4 = CGFloat(drand48())
        let alpha4 = CGFloat(drand48())
        
        let redValue5 = CGFloat(drand48())
        let blueValue5 =  CGFloat(drand48())
        let greenValue5 = CGFloat(drand48())
        let alpha5 = CGFloat(drand48())
        // self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        let color1 = UIColor(red: redValue1, green: greenValue1, blue: blueValue1, alpha: alpha1).cgColor
        
        let color2 = UIColor(red: redValue2, green: greenValue2, blue: blueValue2, alpha: alpha2).cgColor
        
        let color3 = UIColor(red: redValue3, green: greenValue3, blue: blueValue3, alpha: alpha3).cgColor

        let color4 = UIColor(red: redValue4, green: greenValue4, blue: blueValue4, alpha: alpha4).cgColor

        let color5 = UIColor(red: redValue5, green: greenValue5, blue: blueValue5, alpha: alpha5).cgColor

        
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPoint(x:0, y:0)
        gradientLayer.endPoint = CGPoint(x:1,y:1)

        
    }
}

