//
//  ViewController.swift
//  Project17 - TableView
//
//  Created by zhouxinfang on 2017/11/9.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{

    @IBOutlet var tableView:UITableView!
    
    var dataSource = ["第一行","第二行","第三行","第四行","第五行","第六行","第七行","第八行","第九行","第十行","第十一行","第十二行","第十三行"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
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
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let content = self.dataSource[sourceIndexPath.row]
        self.dataSource.remove(at: sourceIndexPath.row)
        self.dataSource.insert(content, at: destinationIndexPath.row)
    }
    
    @IBAction  func addTableCell()
    {
//        self.dataSource.insert(String(self.dataSource.count+1), at: self.dataSource.count)
//        self.tableView.reloadData()
        let indexPath:IndexPath =  IndexPath.init(row: self.dataSource.count, section: 0)
        self.dataSource.append("增加行")
        self.tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    @IBAction func deleteTableCell()
    {
        if self.dataSource.count > 0
        {
            self.dataSource.removeLast()
            let indexPath:IndexPath =  IndexPath.init(row: (self.dataSource.count), section: 0)
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
        
    }
    
    @IBAction func editTableView()
    {
        let editStatus = !(self.tableView.isEditing)
        self.tableView.isEditing = editStatus
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

