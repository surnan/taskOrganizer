//
//  ComponentViewController+UITableView.swift
//  taskOrganizer
//
//  Created by admin on 5/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension ComponentViewController {
    
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
        deleteRow.backgroundColor = UIColor.red; editRow.backgroundColor = UIColor.teal
        return [deleteRow, editRow]
    }
    
    private func editHandlerFunction(action: UITableViewRowAction, indexPath: IndexPath) {
        let myCreateComponentViewController = CreateComponentViewController()
        let myComponent = self.componentList[indexPath.row]
        myCreateComponentViewController.component = myComponent
        myCreateComponentViewController.delegate = self
        let myNavigationController = UINavigationController(rootViewController: myCreateComponentViewController)
        self.present(myNavigationController, animated: true)
    }

    private func deleteHandlerFunction(action: UITableViewRowAction, indexPath: IndexPath) {
        let myComponentViewController = ComponentViewController()
        navigationController?.pushViewController(myComponentViewController, animated: true)
    }
}
