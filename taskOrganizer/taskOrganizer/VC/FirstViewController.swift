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
    
    //MARK:- Protocol Classes Defined
    var dailyTasksList = [DailyTask]()
    
    func didAddTask(myTaskItem: DailyTask){
        dailyTasksList.append(myTaskItem)
        let newIndexPath = IndexPath(row: dailyTasksList.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .left)
    }
    
    func didEditTask(myTaskItem: DailyTask){
        print("DID EDIT TASK CALLED")
        let row = dailyTasksList.index(of: myTaskItem)
        dailyTasksList[row!].name = myTaskItem.name
        tableView.reloadData()
    }
    
    
    //MARK:- My Functions
    private func setupNavigationBar(){
        navigationItem.title = "FirstViewController"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(handleSettings))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus"), style: .plain, target: self, action: #selector(handleAdd))
    }
    
    @objc private func handleAdd(){
        let myCreateTaskViewController = CreateTaskViewController()
        myCreateTaskViewController.delegate = self
        let myNavController = UINavigationController(rootViewController: myCreateTaskViewController)
        present(myNavController, animated: true)
    }
    
    @objc private func handleSettings(){
        let myNavController = UINavigationController(rootViewController: SettingsViewController())
        present(myNavController, animated: true)
    }
    
    //MARK:- Swift Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.white
        setupNavigationBar()
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<DailyTask>(entityName: "DailyTask")

        
//        let sort11 = NSSortDescriptor(key: #keyPath(DailyTask.name), ascending: true)
//        fetchRequest.sortDescriptors = [sort11]
        
        
        do {
            let tempTasks = try context.fetch(fetchRequest)
            self.dailyTasksList = tempTasks
            
            self.dailyTasksList.sort(by: {$0 < $1})
            
            self.tableView.reloadData()
        } catch let err {
            print("Error fetching data \(err)")
        }
        self.tableView.register(DailyTaskCell.self, forCellReuseIdentifier: "MyCell")
    }
}

