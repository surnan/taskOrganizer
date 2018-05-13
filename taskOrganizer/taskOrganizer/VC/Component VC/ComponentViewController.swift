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
