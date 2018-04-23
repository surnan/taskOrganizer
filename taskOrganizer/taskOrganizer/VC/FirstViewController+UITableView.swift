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
    
    
}
