//
//  FirstViewController.swift
//  taskOrganizer
//
//  Created by admin on 4/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController, CreateTaskViewControllerDelegate {

    func didAddTask(myTaskItem: taskItem){
        print("temp")
        
        dummyDataTasks.append(taskItem(name: myTaskItem.name, date: Date(), completed: true))

        let newIndexPath = IndexPath(row: dummyDataTasks.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .left)
        
    }

    
    var dummyDataTasks = [taskItem]()

    func setupDummyData(){
        dummyDataTasks.append(taskItem(name: "Wake Up", date: Date(), completed: true))
        dummyDataTasks.append(taskItem(name: "Insanity", date: Date(), completed: false))
        dummyDataTasks.append(taskItem(name: "Brush Teeth", date: Date(), completed: true))
        dummyDataTasks.append(taskItem(name: "Leave for Work", date: Date(), completed: false))
    }
    
    
    func addCompany(){
        dummyDataTasks.append(taskItem(name: "Wake Up", date: Date(), completed: true))

        //        tableView.reloadData()  //<-- no animation
    
        let newIndexPath = IndexPath(row: dummyDataTasks.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .left)
    
    
    }
    
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
        setupDummyData()
        self.tableView.register(DailyTaskCell.self, forCellReuseIdentifier: "MyCell")
    }
}
