//
//  ViewController.swift
//  Project22VideoCapture
//
//  Created by zhouxinfang on 2017/12/1.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet var tableView:UITableView!
    
    var data = ["视频录制","音频录制"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var tableViewCell = tableView.dequeueReusableCell(withIdentifier: "tableViewIdentifier")
        if tableViewCell == nil
        {
            tableViewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "tableViewIdentifier")
        }
        tableViewCell?.textLabel?.text = data[indexPath.row]
        return tableViewCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let functionName = data[indexPath.row]
        if functionName == "视频录制"
        {
            let viewController = storyboard?.instantiateViewController(withIdentifier: "KHVideoCaptureViewController")
            self.navigationController?.pushViewController(viewController!, animated: true)

        }
        else
        {
            let viewController = storyboard?.instantiateViewController(withIdentifier: "KHAudioCaptureController")
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
    }


}

