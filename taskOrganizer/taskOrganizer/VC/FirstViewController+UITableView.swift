//
//  FirstViewController+UITableView.swift
//  taskOrganizer
//
//  Created by admin on 4/19/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import CoreData

extension FirstViewController {
    
    //MARK: UITableView function
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyTasksList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let temp = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! DailyTaskCell
        temp.nameLabel.text = dailyTasksList[indexPath.row].name
        temp.nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "HH:mm"
         temp.dateLabel.text = myDateFormatter.string(from: dailyTasksList[indexPath.row].time!)
        return temp
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myView = UIView()
        myView.backgroundColor = UIColor.lightBlue
        return myView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, indexPath) in
            //Delete Action - Start
            let tempTask = self.dailyTasksList[indexPath.row]
            self.dailyTasksList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            
            let context = CoreDataManager.shared.persistentContainer.viewContext
            //            let tempTask = self.dailyTasksList[indexPath.row]  <---- weird errors if you declare it here instead
            context.delete(tempTask)
            do {
                try context.save()
            } catch let delError {
                fatalError("Unable to save context after object deletion \(delError)")
            }
        }
        deleteAction.backgroundColor = UIColor.lightRed
        //Delete Action - Finish

        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: editHandlerFunction)
        editAction.backgroundColor = UIColor.darkBlue
        
        let taskAction = UITableViewRowAction(style: .normal, title: "Task", handler: taskHandlerFunction)
        
        taskAction.backgroundColor = UIColor.mediumPurple
        
        
        
        return [deleteAction, taskAction, editAction]
    }


    private func editHandlerFunction(action: UITableViewRowAction, indexPath: IndexPath) {
        print("Edit Selected")
        let myDailyTask = self.dailyTasksList[indexPath.row]
        let myCreateTaskViewController = CreateTaskViewController()
        myCreateTaskViewController.dailyTask = myDailyTask
        myCreateTaskViewController.delegate = self
        let myNavigationController = UINavigationController(rootViewController: myCreateTaskViewController)
        self.present(myNavigationController, animated: true, completion: nil)
    }
    
    
    private func taskHandlerFunction(action: UITableViewRowAction, indexPath: IndexPath) {
        print("taskHandlerActionSelected")
    }
    
    
    
    
    
    
}


/*
 let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (_, indexPath) in
 print("Edit Selected")
 let myDailyTask = self.dailyTasksList[indexPath.row]
 let myCreateTaskViewController = CreateTaskViewController()
 myCreateTaskViewController.dailyTask = myDailyTask
 myCreateTaskViewController.delegate = self
 let myNavigationController = UINavigationController(rootViewController: myCreateTaskViewController)
 self.present(myNavigationController, animated: true, completion: nil)
 }
 editAction.backgroundColor = UIColor.darkBlue
 //Edit Action - Finish
 */

