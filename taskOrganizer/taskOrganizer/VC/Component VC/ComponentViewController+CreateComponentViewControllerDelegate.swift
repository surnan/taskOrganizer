//
//  ComponentViewController+.swift
//  taskOrganizer
//
//  Created by admin on 5/13/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension ComponentViewController {
    //MARK:- CreateTaskViewControllerDelegate Protocol Functions
    func didAddComponent(myComponent: Component){
        componentList.append(myComponent)
        let tempIndexPath = IndexPath(row: componentList.count - 1, section: 0)
        tableView.insertRows(at: [tempIndexPath], with: .left)
    }
    
    func didEditComponent(myComponent: Component){
        if let row = componentList.index(of: myComponent) {
            componentList[row] = myComponent
            tableView.reloadData()
        }
    }
}
