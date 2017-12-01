//
//  ViewController.swift
//  SimpleTimerWatch
//
//  Created by zhouxinfang on 2017/10/16.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit


class ViewController: UIViewController
{
    @IBOutlet weak var pauseButton:UIButton!

    @IBOutlet weak var startButton:UIButton!

    @IBOutlet weak var timeDisplayLabel:UILabel!
    
    var isRuning:Bool = false

    var count:Float = 0.0
    
    var timer:Timer = Timer();

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButtonDidClick(sender:AnyObject)
    {
        if !isRuning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(ViewController.undateTimer), userInfo: nil, repeats: true)
            isRuning = true
        }
    }
    
    @IBAction func pauseButtonDidClick(sender:AnyObject)
    {
        isRuning = false
        timer.invalidate()
    }
    
    @IBAction func resetButtonDidClick(sender:AnyObject)
    {
        count = 0.0
        timer.invalidate()
        isRuning = false
        timeDisplayLabel.text = String(count)
    }
    
    @objc func undateTimer()
    {
        count += 0.1
        timeDisplayLabel.text = String(count)
    }

}

