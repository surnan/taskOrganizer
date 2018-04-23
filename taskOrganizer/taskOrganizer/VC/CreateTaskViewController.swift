//
//  CreateTaskViewController.swift
//  taskOrganizer
//
//  Created by admin on 4/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

protocol CreateTaskViewControllerDelegate {
    func didAddTask(myTaskItem: taskItem)
}


class CreateTaskViewController: UIViewController {
    
    
    var delegate: CreateTaskViewControllerDelegate?
    
    var backButton : UIButton = {
        var myButton = UIButton()
        myButton.setTitle("CLICK ME", for: .normal)
        myButton.addTarget(self, action: #selector(handleMyButton), for: .touchUpInside)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }()
    
    
    var nameLabel: UILabel = {
       var myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.text = "NAME: "
        return myLabel
    }()
    
    var nameTextField: UITextField = {
       var myNameTextField = UITextField()
        myNameTextField.translatesAutoresizingMaskIntoConstraints = false
        myNameTextField.placeholder = "Please Enter Name"
        return myNameTextField
    }()
    
    
    @objc func handleMyButton(){
        print("BUTTON PRESSED")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setupNavigationBar(){
        navigationItem.title = "CreateTaskViewController"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "*RIGHT*", style: .plain, target: self, action: #selector(handleAdd))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "CANCEL", style: .plain, target: self, action: #selector(handleSettings))
    }
    
    func organizeUI(){
        [backButton].forEach { view.addSubview($0)}
        backButton.target(forAction: #selector(handleMyButton), withSender: nil)
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        setupUI()
    }
    
    
    func setupUI(){
        [nameLabel, nameTextField].forEach{view.addSubview($0)}
        
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 50).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightPurple
        setupNavigationBar()
        organizeUI()
    }
    
    @objc func handleAdd(){
        print("click**")
        
        
        self.dismiss(animated: true) {
            let tempTaskItem = taskItem(name: self.nameTextField.text!, date: Date(), completed: true)
            self.delegate?.didAddTask(myTaskItem: tempTaskItem)
        }
    }
    
    @objc func handleSettings(){
        self.dismiss(animated: true, completion: nil)
        print("**click")
    }
}
