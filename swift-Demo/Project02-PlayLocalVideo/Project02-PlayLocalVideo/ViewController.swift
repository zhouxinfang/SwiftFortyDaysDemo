//
//  ViewController.swift
//  Project02-PlayLocalVideo
//
//  Created by zhouxinfang on 2017/10/18.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView:UITableView!
    
    var videoData = [
        VideoInfo(videoImageName:"videoScreenShot01",videoTitle:"动画标题1",videoSource:"")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 220
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return videoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")as! TableViewCell
        let videoInfo = videoData[indexPath.row]
        cell.layoutTableCellWithVideoInfo(videoInfo)
        return cell
    }
    
    
    @IBAction func playButtonDidClick(sender:AnyObject)
    {
        
        let path = Bundle.main.path(forResource: "emoji zone", ofType:  "mp4")
        var playerView = AVPlayer()
        playerView = AVPlayer.init(url:NSURL(fileURLWithPath: path!) as URL)
        
        let playViewController = AVPlayerViewController()
        playViewController.player = playerView
        
        self.present(playViewController, animated: true) {
            playViewController.player?.play()
        }
    }
}

