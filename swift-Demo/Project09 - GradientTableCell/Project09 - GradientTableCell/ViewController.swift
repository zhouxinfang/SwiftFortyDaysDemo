//
//  ViewController.swift
//  Project09 - GradientTableCell
//
//  Created by zhouxinfang on 2017/11/3.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView:UITableView!
    
    var dataList = ["Go for a fun","Hit the gym","Movement training","Build another swift project","index Zero","Test the Adobe Project","Shopping","Play video games","Play basketball with friends","Go for a fun","Hit the gym","Movement training"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var tableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellIdentifier")
        if (tableViewCell == nil)
        {
            tableViewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "TableViewCellIdentifier")
        }
        tableViewCell?.selectionStyle = UITableViewCellSelectionStyle.none
        tableViewCell?.textLabel?.text = dataList[indexPath.row]
        tableViewCell?.backgroundColor = self.tableViewCellBackgroundColor(indexPath.row)
        return tableViewCell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        
        let addAction:UITableViewRowAction = UITableViewRowAction.init(style: UITableViewRowActionStyle.normal, title: "添加") { (action, indexPath) in
            print("添加按钮点击事件")
        }
        
        let deleteAction:UITableViewRowAction = UITableViewRowAction.init(style: UITableViewRowActionStyle.destructive, title: "删除") { (action, indexPath) in
            print("删除按钮点击事件")
        }
        
        let editAction:UITableViewRowAction = UITableViewRowAction.init(style: UITableViewRowActionStyle.default, title: "编辑") { (action, indexPath) in
            print("编辑按钮点击事件")
        }
        editAction.backgroundColor = UIColor.blue
        return [deleteAction,addAction,editAction];
    }
    
    func tableViewCellBackgroundColor(_ index:NSInteger) -> UIColor
    {
        let itemCount = dataList.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red:1.0,  green: color,  blue:0.0,  alpha:1.0)
    }
}

