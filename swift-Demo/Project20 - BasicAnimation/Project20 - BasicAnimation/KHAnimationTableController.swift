//
//  KHAnimationTableController.swift
//  Project20 - BasicAnimation
//
//  Created by zhouxinfang on 2017/11/21.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

private let titleKey = "key"

private let controllerKey = "controller"


class KHAnimationTableController: UITableViewController {

    let tableData = [[titleKey:"UIView animation",controllerKey:"KHBasicViewAnimationController"],[titleKey:"CABasicAnimation",controllerKey:"KHBasicAnimationController"],[titleKey:"CAKeyframeAnimation",controllerKey:"KHKeyframeAnimationController"],[titleKey:"大招",controllerKey:"KHComplexAnimationController"]]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.title = "动画"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let row = indexPath.row
        if row >= 0 && row < tableData.count
        {
            let dictionary = tableData[row] as NSDictionary
            let title = dictionary[titleKey] as! String
            cell.textLabel?.text = title
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        if row >= 0 && row < tableData.count
        {
            let dictionary = tableData[row] as NSDictionary
            let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            let controllerName:String = String(describing: dictionary[controllerKey]!)
            let cls:AnyClass? = NSClassFromString(nameSpace + "." + controllerName)
            guard let clsType = cls as? UIViewController.Type else
            {
                print("类型不是UIViewController的类型")
                return
            }
            let controller = clsType.init()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }



}
