//
//  ComponentCell.swift
//  taskOrganizer
//
//  Created by admin on 5/15/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ComponentCell: UITableViewCell {
    var nameLabel : UILabel = {
        let tempLabel = UILabel()
        tempLabel.font = UIFont.boldSystemFont(ofSize: 14)
        tempLabel.textColor = UIColor.black
        return tempLabel
    }()
    
    var buttonUp: UIButton = {
        let tempButton = UIButton()
        tempButton.setTitle("      UP     ", for: .normal)
        tempButton.setTitleColor(UIColor.black, for: .normal)
        tempButton.backgroundColor = UIColor.white
//        tempButton.addTarget(self, action: #selector(handleUp), for: .touchUpInside) //doesn't work when defined in this file
        return tempButton
    }()
    
    var buttonDown: UIButton = {
        let tempButton = UIButton()
        tempButton.setTitle("DOWN", for: .normal)
        tempButton.setTitleColor(UIColor.black, for: .normal)
        tempButton.backgroundColor = UIColor.teal
//        tempButton.addTarget(self, action: #selector(handleDown), for: .touchUpInside)  //doesn't work when defined in this file
        return tempButton
    }()
    
    
    @objc private func handleUp(){ //doesn't work when defined in this file
        print("up")
    }
    
    @objc private func handleDown(){ //doesn't work when defined in this file
        print("down")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.lightYellow
        [nameLabel, buttonUp, buttonDown].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        [nameLabel, buttonUp, buttonDown].forEach{addSubview($0)}
        
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        buttonDown.rightAnchor.constraint(equalTo: rightAnchor, constant: -50).isActive = true
        buttonDown.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        buttonUp.rightAnchor.constraint(equalTo: buttonDown.leftAnchor, constant: -10).isActive = true
        buttonUp.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
