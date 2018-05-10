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
       self.dailyTasksList.sort(by: {$0 < $1})
        let row = dailyTasksList.index(of: myTaskItem)
        let newIndexPath = IndexPath(row: row!, section: 0)
//        let newIndexPath = IndexPath(row: dailyTasksList.count - 1, section: 0)  //Insert row at bottom
        tableView.insertRows(at: [newIndexPath], with: .middle)
    }

    
    func didEditTask(myTaskItem: DailyTask){
        print("DID EDIT TASK CALLED")
        let row = dailyTasksList.index(of: myTaskItem)
        dailyTasksList[row!].name = myTaskItem.name
        tableView.reloadData()
    }
    
    
    //MARK:- My Functions
    private func setupNavigationBar(){
        navigationItem.title = "TASK LIST"
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(handleSettings))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Delete All", style: .plain, target: self, action: #selector(handleDeleteAll))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "plus"), style: .plain, target: self, action: #selector(handleAdd))
    }

    
    @objc private func handleDeleteAll(){
        let context = CoreDataManager.shared.persistentContainer.viewContext
//      BELOW WORKS - but doesn't have nice animation
        dailyTasksList.forEach { (task) in
            context.delete(task)
        }
        do {
            try context.save()
            var indexPathToDelete = [IndexPath]()
            for (index, _) in dailyTasksList.enumerated() {
                let myIndexPath = IndexPath(row: index, section: 0)
                indexPathToDelete.append(myIndexPath)
            }
            dailyTasksList.removeAll()
            tableView.deleteRows(at: indexPathToDelete, with: .right)
//            tableView.reloadData() //works but doesn't have animation
        } catch let saveErr {
            print("Could't save after deleting all core data entries: \(saveErr)")
        }
    }

    @objc private func handleAdd(){
        let myCreateTaskViewController = CreateTaskViewController()
        myCreateTaskViewController.delegate = self
        let myNavController = UINavigationController(rootViewController: myCreateTaskViewController)
        present(myNavController, animated: true)
    }
    
    @objc private func handleSettings(){
//        self.tableView.isEditing = true  //Creates the red circles in left column for editing
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
//            self.dailyTasksList.sort(by: {$0 < $1})
            self.tableView.reloadData()
        } catch let err {
            print("Error fetching data \(err)")
        }
        self.tableView.register(DailyTaskCell.self, forCellReuseIdentifier: "MyCell")
    }
}

