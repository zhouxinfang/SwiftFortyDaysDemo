//
//  ViewController.swift
//  Project05 - 3DTouch
//
//  Created by zhouxinfang on 2017/10/19.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ViewController"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushViewController()
    {
        let storyBoard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let type1ViewController:Type1ViewController =  storyBoard.instantiateViewController(withIdentifier: "Type1ViewController") as! Type1ViewController
        self.navigationController?.pushViewController(type1ViewController, animated: true)
    }

}

