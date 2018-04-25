//
//  FirstViewController.swift
//  taskOrganizer
//
//  Created by admin on 4/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: UITableViewController, CreateTaskViewControllerDelegate {

    func didAddTask(myTaskItem: taskItem){
        print("temp")
        
//        dummyDataTasks.append(taskItem(name: myTaskItem.name, date: Date(), completed: true))
//
//        let newIndexPath = IndexPath(row: dummyDataTasks.count - 1, section: 0)
//        tableView.insertRows(at: [newIndexPath], with: .left)
        
    }

   
    var dailyTasksList = [DailyTask]()
    
    
    
//    func addCompany(){
//        dummyDataTasks.append(taskItem(name: "Wake Up", date: Date(), completed: true))
//
//        //        tableView.reloadData()  //<-- no animation
//
//        let newIndexPath = IndexPath(row: dummyDataTasks.count - 1, section: 0)
//        tableView.insertRows(at: [newIndexPath], with: .left)
//    }
    
    func tempProtocolFunction(){
        print("tempProtocolFunction executed")
    }

    func setupNavigationBar(){
        navigationItem.title = "FirstViewController"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(handleSettings))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus"), style: .plain, target: self, action: #selector(handleAdd))
    }
    
    @objc func handleAdd(){
//        addCompany()
        
        let myCreateTaskViewController = CreateTaskViewController()
        myCreateTaskViewController.delegate = self
        let myNavController = UINavigationController(rootViewController: myCreateTaskViewController)
        present(myNavController, animated: true)
    }

    @objc func handleSettings(){
        let myNavController = UINavigationController(rootViewController: SettingsViewController())
        present(myNavController, animated: true)
    }
    
    
    //MARK: ViewController Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.white
        setupNavigationBar()
//        setupDummyData()
        
        let persistentContainer = NSPersistentContainer(name: "DailyTaskDefinitionFile")
        persistentContainer.loadPersistentStores { (store, err) in
            if let err = err {
                fatalError("Loading of store failed: \(err)")
            }
        }
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<DailyTask>(entityName: "DailyTask")
        
        do {
            let tempTasks = try context.fetch(fetchRequest)
            tempTasks.forEach{dailyTasksList.append($0)}
            
        } catch let err {
            print("Error fetching data \(err)")
        }
        
        
        self.tableView.register(DailyTaskCell.self, forCellReuseIdentifier: "MyCell")
    }
}
