//
//  AddTaskViewController.swift
//  taskOrganizer
//
//  Created by admin on 4/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegate {
    func tempProtocolFunction()
}


class AddTaskViewController: UIViewController {
    
     var backButton : UIButton = {
        var myButton = UIButton()
        myButton.setTitle("CLICK ME", for: .normal)
        myButton.addTarget(self, action: #selector(handleMyButton), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }()
    
    @objc func handleMyButton(){
        print("BUTTON PRESSED")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setupNavigationBar(){
        navigationItem.title = "AddTaskViewController"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "*RIGHT*", style: .plain, target: self, action: #selector(handleAdd))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "CANCEL", style: .plain, target: self, action: #selector(handleSettings))
    }
    
    func organizeUI(){
        
        [backButton].forEach { view.addSubview($0)}
          backButton.target(forAction: #selector(handleMyButton), withSender: nil)
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightPurple
        setupNavigationBar()
        organizeUI()
    }
    
    @objc func handleAdd(){
        print("click**")
    }
    
    @objc func handleSettings(){
        self.dismiss(animated: true, completion: nil)
        print("**click")
    }
}
