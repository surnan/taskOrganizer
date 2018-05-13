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

    //MARK:- CreateTaskViewControllerDelegate Protocol Functions
    func didAddComponent(myComponent: Component){
        print("test")
        componentList.append(myComponent)
        
        let tempIndexPath = IndexPath(row: componentList.count - 1, section: 0)
        
        tableView.insertRows(at: [tempIndexPath], with: .middle)
        tableView.reloadData()
    }
    
    func didEditComponent(myComponent: Component){
        print("test")
    }
    
    //MARK:- TableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tempTableViewCell = UITableViewCell()

        tempTableViewCell.textLabel?.textColor = UIColor.black
        tempTableViewCell.textLabel?.text = componentList[indexPath.row].name
        
        return tempTableViewCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return componentList.count
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editRow = UITableViewRowAction(style: .normal, title: "Edit", handler: editHandlerFunction)
        let deleteRow = UITableViewRowAction(style: .normal, title: "Delete", handler: deleteHandlerFunction)
        return [editRow, deleteRow]
    }
    
    private func editHandlerFunction(action: UITableViewRowAction, indexPath: IndexPath) {
        print("Edit Selected")
        let myComponent = self.componentList[indexPath.row]
        let myCreateComponentViewController = CreateComponentViewController()
        myCreateComponentViewController.component = myComponent
        myCreateComponentViewController.delegate = self
        let myNavigationController = UINavigationController(rootViewController: myCreateComponentViewController)
        self.present(myNavigationController, animated: true, completion: nil)
    }
    
    private func deleteHandlerFunction(action: UITableViewRowAction, indexPath: IndexPath) {
        print("Delete Selected")
        let myComponentViewController = ComponentViewController()
        navigationController?.pushViewController(myComponentViewController, animated: true)
    }
    
    //MARK:- UI Functions
    private func setupUI(){
        navigationItem.title = "Components"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(handleAdd))
    }

    @objc private func handleAdd(){
        print("Add selected")
        let myCreateComponentViewController = CreateComponentViewController()
        myCreateComponentViewController.delegate = self
        let myNavController = UINavigationController(rootViewController: myCreateComponentViewController)
        present(myNavController, animated: true)
    }
    
    @objc private func handleCancel(){
        navigationController?.popViewController(animated: true)
    }

    
    //SWIFT Built-In Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Component>(entityName: "Component")
        do {
            let tempTasks = try context.fetch(fetchRequest)
            self.componentList = tempTasks
            self.tableView.reloadData()
        } catch let err {
            print("Error fetching data \(err)")
        }
        self.tableView.register(DailyTaskCell.self, forCellReuseIdentifier: "MyCompanyCell")
    }
}
