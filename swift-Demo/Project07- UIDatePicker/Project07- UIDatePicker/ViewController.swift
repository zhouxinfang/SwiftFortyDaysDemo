//
//  ViewController.swift
//  Project07- UIDatePicker
//
//  Created by zhouxinfang on 2017/10/27.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var datePicker:UIDatePicker!
    
    @IBOutlet var dateDisplayLabel:UILabel!
    
    var dateFormatter = DateFormatter()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let currentDate:Date = Date.init()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.full
        let dateString = dateFormatter.string(from: currentDate)
        dateDisplayLabel.text = dateString
        
        datePicker.setDate(currentDate, animated: false);
        datePicker.locale = Locale.current
        datePicker.addTarget(self, action: #selector(didChangeDatePickValue(datePicker:)), for: UIControlEvents.valueChanged)
        
    }
    
    @objc func didChangeDatePickValue(datePicker:UIDatePicker)
    {
        let date:Date = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        let dateString = dateFormatter.string(from: date)
        dateDisplayLabel.text = dateString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

