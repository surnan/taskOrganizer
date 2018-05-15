//
//  ComponentViewController+UITableView.swift
//  taskOrganizer
//
//  Created by admin on 5/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension ComponentViewController {
    
    
    //    var componentList = [Component]()
    //    var currentDailyTask: DailyTask?
    //    var changeDirection = false
    
    
    //MARK:- TableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCompanyCell") as! ComponentCell
        tempTableViewCell.textLabel?.textColor = UIColor.black
        tempTableViewCell.nameLabel.text = componentList[indexPath.row].name
        
        
        
        tempTableViewCell.buttonDown.tag = indexPath.row
        
        tempTableViewCell.buttonUp.addTarget(self, action: #selector(handleUp), for: .touchUpInside)
        //        tempTableViewCell.buttonDown.addTarget(self, action: #selector(handleDown(a:)), for: .touchUpInside)
        
        
        tempTableViewCell.buttonDown.addTarget(self, action: #selector(handleDown(sender:)), for: .touchUpInside)
        
        
        return tempTableViewCell
    }
    
    @objc private func handleUp(){
        print("up")
    }
    
    @objc func handleDown(sender: UIButton){
        print("down --- \(sender.tag)")
        
        
        tableView.beginUpdates()
        
        let indexPath1 = IndexPath(row: sender.tag + 1, section: 0)
        let indexPath2 = IndexPath(row: sender.tag, section: 0)
        
        tableView.moveRow(at: indexPath1, to: indexPath2)
        tableView.moveRow(at: indexPath2, to: indexPath1)
        tableView.endUpdates()
        
        //edit added just to give me an opportunity to further clarify the previous commit
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return componentList.count
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if changeDirection {
            let editRow = UITableViewRowAction(style: .normal, title: "Details", handler: detailsHandlerFunction)
            let deleteRow = UITableViewRowAction(style: .normal, title: "Delete", handler: deleteHandlerFunction)
            deleteRow.backgroundColor = UIColor.red; editRow.backgroundColor = UIColor.teal
            return [deleteRow, editRow]
        } else {
            let editRow = UITableViewRowAction(style: .normal, title: "UP", handler: upHandlerFunction)
            let deleteRow = UITableViewRowAction(style: .normal, title: "DOWN", handler: downHandlerFunction)
            deleteRow.backgroundColor = UIColor.purple; editRow.backgroundColor = UIColor.green
            return [deleteRow, editRow]
        }
    }
    
    private func upHandlerFunction(action: UITableViewRowAction, myIndexPath: IndexPath){
        tableView.beginUpdates()
        
        let indexPath1 = IndexPath(row: myIndexPath.row - 1, section: 0)
        let indexPath2 = IndexPath(row: myIndexPath.row, section: 0)
        
        tableView.moveRow(at: indexPath1, to: indexPath2)
        tableView.moveRow(at: indexPath2, to: indexPath1)
        tableView.endUpdates()
    }
    
    
    private func downHandlerFunction(action: UITableViewRowAction, myIndexPath: IndexPath){
        tableView.beginUpdates()
        
        let indexPath1 = IndexPath(row: myIndexPath.row + 1, section: 0)
        let indexPath2 = IndexPath(row: myIndexPath.row, section: 0)
        
        tableView.moveRow(at: indexPath1, to: indexPath2)
        tableView.moveRow(at: indexPath2, to: indexPath1)
        tableView.endUpdates()
    }
    
    private func detailsHandlerFunction(action: UITableViewRowAction, indexPath: IndexPath) {
        let myCreateComponentViewController = CreateComponentViewController()
        let myComponent = self.componentList[indexPath.row]
        myCreateComponentViewController.component = myComponent
        myCreateComponentViewController.delegate = self
        let myNavigationController = UINavigationController(rootViewController: myCreateComponentViewController)
        self.present(myNavigationController, animated: true)
    }
    
    private func deleteHandlerFunction(action: UITableViewRowAction, indexPath: IndexPath) {
        let tempComponent = componentList[indexPath.row]
        componentList.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .left)
        let context = CoreDataManager.shared.persistentContainer.viewContext
        context.delete(tempComponent)
        do {
            try context.save()
        } catch let delError {
            fatalError("Unable to save context after object deletion \(delError)")
        }
    }
    
    
    //MARK:- Desperation
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        return .none
//    }
//
//    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.componentList[sourceIndexPath.row]
        componentList.remove(at: sourceIndexPath.row)
        componentList.insert(movedObject, at: destinationIndexPath.row)
        //        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(componentList)")
        // To check for correctness enable: self.tableView.reloadData()
    }
    
}
