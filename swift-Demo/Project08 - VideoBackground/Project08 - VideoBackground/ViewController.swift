//
//  ViewController.swift
//  Project08 - VideoBackground
//
//  Created by zhouxinfang on 2017/11/2.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit
import AVKit


class ViewController: UIViewController {

    var player:AVPlayer! = nil
    
    let horizontalPadding:CGFloat = 15.0
    let buttonHeight:CGFloat = 40.0

    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = Bundle.main.path(forResource: "moments", ofType: "mp4");
        if filePath != nil
        {
            let videoURL = URL.init(fileURLWithPath: filePath!)
            let playerItem = AVPlayerItem.init(url: videoURL)
            player = AVPlayer.init(playerItem: playerItem)
            player.play()
            
            let playerLayer = AVPlayerLayer.init(player: player)
            playerLayer.frame = self.view.frame
            NotificationCenter.default.addObserver(self, selector: #selector(loopVideoPlay), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
            self.view.layer.addSublayer(playerLayer)
            self.addSubviews()
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addSubviews()
    {
        let regisetrButton = UIButton.init(type: UIButtonType.custom)
        regisetrButton.setTitle("注册", for: UIControlState.normal)
        regisetrButton.backgroundColor = UIColor.init(red: 134.0/255.0, green: 147.0/255.0, blue: 1, alpha: 0.8)
        regisetrButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        regisetrButton.frame = CGRect.init(x: horizontalPadding, y: self.view.frame.size.height - buttonHeight - 2*horizontalPadding, width: self.view.frame.size.width - 2*horizontalPadding, height: buttonHeight)
        self.view.addSubview(regisetrButton)
        
        
        let loginButton = UIButton.init(type: UIButtonType.custom)
        loginButton.setTitle("登录", for: UIControlState.normal)
        loginButton.backgroundColor = UIColor.init(red: 255.0/255.0, green: 202.0/255.0, blue: 121.0/255.0, alpha: 0.8)
        loginButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        loginButton.frame = CGRect.init(x: horizontalPadding, y: self.view.frame.size.height - 2*buttonHeight - 3*horizontalPadding, width: self.view.frame.size.width - 2*horizontalPadding, height: buttonHeight)
        self.view.addSubview(loginButton)
    }
    
    @objc func loopVideoPlay()
    {
        self.player.seek(to:kCMTimeZero) { (bool) in
            self.player.play()
        }
    }

}

