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
    func didEditTask(myTaskItem: DailyTask)
}


class CreateTaskViewController: UIViewController {
    
    //MARK:- Pre-Load Variables
    var delegate: CreateTaskViewControllerDelegate?
    
    var dailyTask: DailyTask? {
        didSet {
            nameTextField.text = dailyTask?.name
            guard let currentTime = dailyTask?.time else {return}
            dateField.date = currentTime
        }
    }
    
    
    //MARK:- UI Element definitions
    var backgroundView : UIView = {
        var myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = UIColor.lightBlue
        return myView
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
    
    var dateField: UIDatePicker = {
        var myDate = UIDatePicker()
        myDate.translatesAutoresizingMaskIntoConstraints = false
        myDate.datePickerMode = .time
        return myDate
    }()
    
    //MARK:- My Functions
    @objc private func handleAddOrSave(){
        let context = CoreDataManager.shared.persistentContainer.viewContext
        if dailyTask == nil {
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
        } else {
            dailyTask?.name = nameTextField.text
            dailyTask?.time = dateField.date
            do {
                try context.save()
                dismiss(animated: true, completion: {
                    self.delegate?.didEditTask(myTaskItem: self.dailyTask!)
                })
            } catch let saveErr {
                print("Failed to save Company: \(saveErr)")
            }
        }
    }
    
    @objc private func handleCancel(){ self.dismiss(animated: true, completion: nil)}

    
    //MARK:- Setting up UI
    private func organizeUI(){
        [ backgroundView, nameLabel, nameTextField, dateField].forEach{view.addSubview($0)}
        
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20).isActive = true
        
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 20).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        
        dateField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        dateField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateField.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor).isActive = true
    }
    
    private func setupNavigationBar(){
        navigationItem.title = dailyTask == nil ? "Create" : "Edit"
        let rightButtonStr = dailyTask == nil ? "Add" : "Save"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightButtonStr, style: .plain, target: self, action: #selector(handleAddOrSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "CANCEL", style: .plain, target: self, action: #selector(handleCancel))
    }

    
    //MARK:- Built-In Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightPurple
        setupNavigationBar()
        organizeUI()
    }
}
