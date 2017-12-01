//
//  ViewController.swift
//  Project13 - SlotMachine
//
//  Created by zhouxinfang on 2017/11/7.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet var pickerView:UIPickerView!
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        for i in 0 ..< 100
        {
            dataArray1.append((Int)(arc4random() % 10 ))
            dataArray2.append((Int)(arc4random() % 10 ))
            dataArray3.append((Int)(arc4random() % 10 ))
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startButtoTouchAction(sender: AnyObject)
    {
        pickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 0, animated: true)
        pickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 1, animated: true)
        pickerView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 2, animated: true)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return 100
    }
    
    private func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 80
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        
        if component == 0 {
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        } else if component == 1 {
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        } else {
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
   
}

