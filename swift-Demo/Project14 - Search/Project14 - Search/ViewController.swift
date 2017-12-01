//
//  ViewController.swift
//  Project14 - Search
//
//  Created by zhouxinfang on 2017/11/7.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

struct QSItem
{
    var qsName:String?
    var fullName:String?
    var shortName:String?
    
    init(dictionary dictionay:NSDictionary)
    {
        qsName = dictionay.object(forKey: "qsName") as? String
        fullName = dictionay.object(forKey: "fullName") as? String
        shortName = dictionay.object(forKey: "shortName") as? String
    }
}

class ViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet var searchBar:UISearchBar!
    
    @IBOutlet var tableView:UITableView!
    
    var tableData:NSArray = []
    
    var tableOrignalData:NSArray = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        let filePath = Bundle.main.path(forResource: "qsList", ofType: "plist")
        if filePath != nil
        {
            let qsList = NSArray.init(contentsOfFile: filePath!)
            if qsList != nil
            {
                let tableList = NSMutableArray.init(capacity: (qsList?.count)!)
                qsList?.enumerateObjects({ (dictionary, index, stop) in
                    let item = QSItem.init(dictionary: dictionary as! NSDictionary)
                    if item.fullName != nil && item.qsName != nil && item.shortName != nil
                    {
                        tableList.add(item)
                    }
                })
                if tableList.count > 0
                {
                    tableOrignalData = tableList
                    tableData = tableOrignalData
                    tableView.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK:- searchBar delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        self.filterQsList(keyword: searchText)
    }
    
    // MARK:- tableView delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tableData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var tableViewCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCellIdentifier")
        if tableViewCell == nil
        {
            tableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "UITableViewCellIdentifier")
        }
        let item = tableData[indexPath.row] as? QSItem
        if item?.qsName != nil
        {
            tableViewCell?.textLabel?.text = item?.qsName
        }
        return tableViewCell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 40
    }
    
    func filterQsList(keyword key:String)
    {
        
        if key.characters.count > 0
        {
            let tableList = NSMutableArray.init(capacity: tableOrignalData.count)
            tableOrignalData.enumerateObjects {(item, index, stop)
                in
                let qsItem = item as! QSItem
                let shortNameContains = qsItem.shortName?.contains(key)
                let fullNameContains = qsItem.fullName?.contains(key)
                let qsNameContains = qsItem.qsName?.contains(key)
                if let shortNameContain = shortNameContains
                {
                    if shortNameContain
                    {
                        tableList.add(qsItem)
                    }
                }
                else if let fullNameContain = fullNameContains
                {
                    if fullNameContain
                    {
                        tableList.add(qsItem)
                    }
                }
                else if let qsNameContain = qsNameContains
                {
                    if qsNameContain
                    {
                        tableList.add(qsItem)
                    }
                }
            }
            self.tableData = tableList
            self.tableView.reloadData()
        }
        else
        {
            self.tableData = tableOrignalData
            self.tableView.reloadData()
        }
    }
    
}

