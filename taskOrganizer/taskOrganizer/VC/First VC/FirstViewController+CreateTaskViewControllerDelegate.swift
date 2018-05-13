//
//  FirstViewController+CreateTaskViewControllerDelegate.swift
//  taskOrganizer
//
//  Created by admin on 5/10/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension FirstViewController {
    //MARK:- Protocol Classes Defined
    
    
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
}
