//
//  FirstViewController+UITableView.swift
//  taskOrganizer
//
//  Created by admin on 4/19/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

extension FirstViewController {
    //MARK: UITableView function
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyDataTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let temp = tableView.dequeueReusableCell(withIdentifier: "MyCell") as! DailyTaskCell
        temp.nameLabel.text = dummyDataTasks[indexPath.row].name
        return temp
    }
}
