//
//  FirstViewController.swift
//  taskOrganizer
//
//  Created by admin on 4/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

//class FirstViewController: UIViewController, FirstViewControllerDelegate {


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
        self.navigationItem.title = "HELLO WORLD"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "*RIGHT*", style: .plain, target: self, action: #selector(handleRight))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "*LEFT*", style: .plain, target: self, action: #selector(handleLeft))
    }
    
    @objc func handleRight(){
        let myNavController = UINavigationController(rootViewController: SecondViewController())
        present(myNavController, animated: true)
    }

    @objc func handleLeft(){
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
