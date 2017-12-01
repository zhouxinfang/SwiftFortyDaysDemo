//
//  ZCoreDataHelper.swift
//  Project15 - CoreData
//
//  Created by zhouxinfang on 2017/11/8.
//  Copyright © 2017年 zhouxinfang. All rights reserved.
//

import UIKit
import CoreData

class ZCoreDataHelper: NSObject
{
    static let shared = ZCoreDataHelper()
    
    lazy var persistentContainer: NSPersistentContainer =
        {
            let container = NSPersistentContainer(name: "CoreData")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext ()
    {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func save(teacher name:String, age:Int, gender:String) -> Bool
    {
        //判断老师的名字是否为空的，如果是空的，则报错
        if !name.isEmpty
        {
            let teacher = NSEntityDescription.insertNewObject(forEntityName: "Teacher", into: self.persistentContainer.viewContext)as?Teacher
            teacher?.name = name
            teacher?.age = Int32(age)
            teacher?.gender = gender
            self.saveContext()
        }
        return true
    }
    
    func fetchTeacherLists() -> [Teacher]?
    {
        var teacherList:[Teacher]? = []
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Teacher")
        let list = NSSortDescriptor.init(key: "id", ascending: true)
        request.sortDescriptors = [list]
        let fetchController = NSFetchedResultsController.init(fetchRequest: request, managedObjectContext: self.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        do
        {
            try fetchController.performFetch()
            teacherList = fetchController.fetchedObjects as? [Teacher]
        }catch
        {
            print(error)
        }
        return teacherList
    }
}
