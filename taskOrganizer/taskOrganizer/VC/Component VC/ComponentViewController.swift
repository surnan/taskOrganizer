//
//  ComponentViewController.swift
//  taskOrganizer
//
//  Created by admin on 5/7/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import CoreData

class ComponentViewController:UITableViewController, CreateComponentViewControllerDelegate {
    
    var componentList = [Component]()
    var currentDailyTask: DailyTask?
    var changeDirection = false

    //MARK:- UI Functions
    private func setupUI(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAdd)),
                                              UIBarButtonItem(title: "Re-Order", style: .plain, target: self, action: #selector(handleReOrder))]
        if let taskName = currentDailyTask?.name {
            navigationItem.title = taskName
        }
    }
    
    @objc private func handleReOrder(){
        changeDirection = !changeDirection
        self.tableView.isEditing = !changeDirection
    }
    
    
    @objc private func handleAdd(){
        print("Add selected")
        let myCreateComponentViewController = CreateComponentViewController()
        myCreateComponentViewController.delegate = self
        myCreateComponentViewController.currentDailyTask = currentDailyTask
        let myNavController = UINavigationController(rootViewController: myCreateComponentViewController)
        present(myNavController, animated: true)
    }
    
    
//    @objc private func handleAdd(){
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }

    
    @objc private func handleCancel(){
        navigationController?.popViewController(animated: true)
    }    
    
    //SWIFT Built-In Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
        
//        let context = CoreDataManager.shared.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<Component>(entityName: "Component")
//        do {
//            let tempTasks = try context.fetch(fetchRequest)
//            self.componentList = tempTasks
//            self.tableView.reloadData()
//        } catch let err {
//            print("Error fetching data \(err)")
//        }

        componentList = currentDailyTask?.linkComponent?.allObjects as! [Component]
        self.tableView.register(DailyTaskCell.self, forCellReuseIdentifier: "MyCompanyCell")
    }
    
    
    //MARK:- Desperation
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        return .none
//    }
//
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.componentList[sourceIndexPath.row]
        componentList.remove(at: sourceIndexPath.row)
        componentList.insert(movedObject, at: destinationIndexPath.row)
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(componentList)")
        // To check for correctness enable: self.tableView.reloadData()
    }
    
    
    
    
    
    
}
