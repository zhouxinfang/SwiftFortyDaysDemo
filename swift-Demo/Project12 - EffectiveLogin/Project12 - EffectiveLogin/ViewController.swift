//
//  ViewController.swift
//  Project12 - EffectiveLogin
//
//  Created by zhouxinfang on 2017/11/3.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel:UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let snowView = SnowView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        self.view.insertSubview(snowView, at: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender:UIButton)
    {
        view.endEditing(true)
        let wobble = CAKeyframeAnimation(keyPath: "transform.rotation")
        wobble.duration = 0.25
        wobble.repeatCount = 4
        wobble.values = [0.0, -Double.pi/4, 0.0, Double.pi/4, 0.0]
        wobble.keyTimes = [0.0, 0.25, 0.5, 0.75, 1.0]
        titleLabel.layer.add(wobble, forKey: nil)
    }
   


}

