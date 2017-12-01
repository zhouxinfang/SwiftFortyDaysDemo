//
//  KHComplexAnimationController.swift
//  Project20BasicAnimation
//
//  Created by zhouxinfang on 2017/11/22.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class KHComplexAnimationController: UIViewController {


    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "大招"
        let holderView = KHHolderView(frame: CGRect(x: self.view.bounds.width / 2 - 100.0 / 2,
                                                    y: view.bounds.height / 2 - 100.0 / 2,
                                                    width: 100.0,
                                                    height: 100.0))
        view.addSubview(holderView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
