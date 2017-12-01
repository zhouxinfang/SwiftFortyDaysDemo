//
//  TableViewController.swift
//  Project07- UIDatePicker
//
//  Created by zhouxinfang on 2017/10/27.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView:UITableView!

    var dataSource = ["UIDatePicker","UIPickerView"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let title = dataSource[indexPath.row]
        if (title == "UIDatePicker")
        {
            let viewController = storyboard?.instantiateViewController(withIdentifier: "DatePickerViewController")
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
        else if (title == "UIPickerView")
        {
            let viewController = storyboard?.instantiateViewController(withIdentifier: "PickerViewController")
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var tableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellIdentifier")
        if (tableViewCell == nil)
        {
            tableViewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "TableViewCellIdentifier")
        }
        tableViewCell?.textLabel?.text = dataSource[indexPath.row]
        return tableViewCell!
    }
    


}
