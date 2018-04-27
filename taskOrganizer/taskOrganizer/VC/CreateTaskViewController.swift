//
//  CreateTaskViewController.swift
//  taskOrganizer
//
//  Created by admin on 4/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import CoreData

protocol CreateTaskViewControllerDelegate {
    func didAddTask(myTaskItem: DailyTask)
}


class CreateTaskViewController: UIViewController {
    
    
    var delegate: CreateTaskViewControllerDelegate?
    
    var backButton : UIButton = {
        var myButton = UIButton()
        myButton.setTitle("CLICK ME", for: .normal)
        myButton.setTitleColor(.black, for: .normal)
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ADD", style: .plain, target: self, action: #selector(handleAdd))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "CANCEL", style: .plain, target: self, action: #selector(handleSettings))
    }
    
    func organizeUI(){
        
        [nameLabel, nameTextField, backButton].forEach{view.addSubview($0)}
        
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 50).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        backButton.target(forAction: #selector(handleMyButton), withSender: nil)
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 50).isActive = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightPurple
        setupNavigationBar()
        organizeUI()
    }
    
    @objc func handleAdd(){
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let tempTask = NSEntityDescription.insertNewObject(forEntityName: "DailyTask", into: context)
        tempTask.setValue(nameTextField.text!, forKey: "name")
        tempTask.setValue(true, forKey: "completed")
        tempTask.setValue(Date(), forKey: "time")
        
        do {
            try context.save()
            dismiss(animated: true) {
                self.delegate?.didAddTask(myTaskItem: tempTask as! DailyTask)
            }
        } catch let saveErr {
            print("Failed to save Company: \(saveErr)")
        }
    }
    
    @objc func handleSettings(){
        self.dismiss(animated: true, completion: nil)
    }
}
