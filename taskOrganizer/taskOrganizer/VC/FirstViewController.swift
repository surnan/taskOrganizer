//
//  FirstViewController.swift
//  taskOrganizer
//
//  Created by admin on 4/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController, FirstViewControllerDelegate {

    struct tempTask{
        var name: String
        var date: Date
        var completed: Bool
    }
    
    var dummyDataTasks = [tempTask]()


    func setupDummyData(){
        let task1 = tempTask(name: "Wake Up", date: Date(), completed: true)
        let task2 = tempTask(name: "Insanity", date: Date(), completed: false)
        let task3 = tempTask(name: "Brush Teeth", date: Date(), completed: true)
        let task4 = tempTask(name: "Leave for Work", date: Date(), completed: false)
        
        dummyDataTasks.append(task1)
        dummyDataTasks.append(task2)
        dummyDataTasks.append(task3)
        dummyDataTasks.append(task4)
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
        let myNavController = UINavigationController(rootViewController: AddTaskViewController())
        present(myNavController, animated: true)
    }

    @objc func handleSettings(){
        let myNavController = UINavigationController(rootViewController: SettingsViewController())
        present(myNavController, animated: true)
    }
    
    
    
    //MARK: ViewController Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        setupNavigationBar()
        setupDummyData()
        self.tableView.register(DailyTaskCell.self, forCellReuseIdentifier: "MyCell")
    }
}
