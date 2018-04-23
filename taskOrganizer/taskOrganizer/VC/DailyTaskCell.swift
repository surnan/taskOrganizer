//
//  DailyTaskCell.swift
//  taskOrganizer
//
//  Created by admin on 4/18/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class DailyTaskCell: UITableViewCell {
    
    var nameLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.text = "Apple"
        tempLabel.backgroundColor = UIColor.white
        tempLabel.textColor = UIColor.blue
        return tempLabel
    }()

    var dateLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.text = "11/12/2018"
        tempLabel.backgroundColor = UIColor.blue
        tempLabel.textColor = UIColor.white
        return tempLabel
    }()


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.teal
        
        [nameLabel, dateLabel].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        [nameLabel, dateLabel].forEach{addSubview($0)}
        
        
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

