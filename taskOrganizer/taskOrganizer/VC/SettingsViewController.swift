//
//  SettingsViewController.swift
//  taskOrganizer
//
//  Created by admin on 4/17/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController{
    
    
    private func setupNavigationMenu() {
        print("test")
        
        navigationItem.title = "SETTINGS"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "CANCEL", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "SAVE", style: .done, target: self, action: #selector(handleSave))
    }
    
    @objc private func handleCancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleSave(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.gray
        setupNavigationMenu()
    }
}
