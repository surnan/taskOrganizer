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

            let tempTask = self.dailyTasksList[indexPath.row]

            self.dailyTasksList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            
            let context = CoreDataManager.shared.persistentContainer.viewContext
//            let tempTask = self.dailyTasksList[indexPath.row]
            context.delete(tempTask)
            
            
            do {
                try context.save()
            } catch let delError {
                fatalError("Unable to save context after object deletion \(delError)")
            }
            
            
        }
        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (_, indexPath) in
            print("Edit Selected")
        }
        return [deleteAction, editAction]
    }
}
