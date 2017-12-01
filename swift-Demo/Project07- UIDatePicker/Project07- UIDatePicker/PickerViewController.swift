//
//  PickerViewController.swift
//  Project07- UIDatePicker
//
//  Created by zhouxinfang on 2017/10/27.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    var pickerData = ["青铜","白银","黄金","铂金","钻石","星耀","王者"]
    
    @IBOutlet var pickerDisplayLabel:UILabel!

    @IBOutlet var pickerView:UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let string = pickerData[row]
        pickerDisplayLabel.text = string
        
    }

}
