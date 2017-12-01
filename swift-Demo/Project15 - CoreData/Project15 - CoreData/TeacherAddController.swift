//
//  TeacherAddController.swift
//  Project15 - CoreData
//
//  Created by zhouxinfang on 2017/11/8.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class TeacherAddController: UIViewController {

    @IBOutlet var nameTextField:UITextField!
    
    @IBOutlet var ageTextField:UITextField!
    
    @IBOutlet var genderSwitch:UISwitch!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let rightBarButtonItem = UIBarButtonItem.init(title: "添加", style: UIBarButtonItemStyle.plain, target: self, action: #selector(TeacherAddController.addSingleTeacherAction))
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func addSingleTeacherAction()
    {
        var showTips = false
        if let nameString = nameTextField.text
        {
            if nameString.isEmpty
            {
                showTips = true
            }
        }

        if let ageString = ageTextField.text
        {
            if ageString.isEmpty
            {
                showTips = true
            }
        }
        if showTips
        {
           let alertController = UIAlertController.init(title: "温馨提示", message: "请填写完成", preferredStyle: UIAlertControllerStyle.alert)
            let confirmAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.cancel, handler: { (alertAction) in
                
            })
            alertController.addAction(confirmAction)
            self.present(alertController, animated: true, completion: {
                
            })
        }
        else
        {
            let gender = genderSwitch.isOn ? "男":"女"
            ZCoreDataHelper.shared.save(teacher: nameTextField.text!, age: Int(ageTextField.text!)!, gender: gender)
        }

    }
}
