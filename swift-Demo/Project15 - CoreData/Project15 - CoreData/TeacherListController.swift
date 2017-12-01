//
//  TeacherListController.swift
//  Project15 - CoreData
//
//  Created by zhouxinfang on 2017/11/8.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class TeacherListController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tableView:UITableView! = nil
    
    var tableData:[Teacher]? = []
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        tableData = ZCoreDataHelper.shared.fetchTeacherLists()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- tableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableData != nil
        {
           return tableData!.count
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "TeacherTableCellIdentifier")
        if tableData != nil
        {
            let tableCell:TeacherTableCell = tableViewCell as! TeacherTableCell
            
            let item = tableData![indexPath.row]
            if item.name != nil
            {
                tableCell.nameLabel?.text = item.name
                tableCell.age?.text = String(item.age)

            }
        }
        
        return tableViewCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 40
    }
    

}
