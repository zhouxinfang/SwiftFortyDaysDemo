//
//  ViewController.swift
//  Project15 - CoreData
//
//  Created by zhouxinfang on 2017/11/8.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addTeacherAction()
    {
        let storyBoard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let teacherListController =  storyBoard.instantiateViewController(withIdentifier: "TeacherAddController")
        self.navigationController?.pushViewController(teacherListController, animated: true)
    }
    
    @IBAction func fetchTeacherListAction()
    {
        let storyBoard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let teacherListController =  storyBoard.instantiateViewController(withIdentifier: "TeacherListController")
        self.navigationController?.pushViewController(teacherListController, animated: true)
    }
    
    @IBAction func addStudentAction()
    {
        
    }

    @IBAction func fetchStudentListAction()
    {
        let storyBoard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let studentListController =  storyBoard.instantiateViewController(withIdentifier: "StudentListController")
        self.navigationController?.pushViewController(studentListController, animated: true)
    }
}

