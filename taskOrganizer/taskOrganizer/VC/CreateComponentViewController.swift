//
//  CreateComponentViewController.swift
//  taskOrganizer
//
//  Created by admin on 5/12/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import CoreData


protocol CreateComponentViewControllerDelegate {
    func didAddComponent(myComponent: Component)
    func didEditComponent(myComponent: Component)
}



class CreateComponentViewController:UIViewController {
    
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

    
    var delegate: CreateComponentViewControllerDelegate?
    var component: Component?
    
    //MARK:- UI Functions
    
    private func setupUI(){
        [backgroundView, nameLabel, nameTextField].forEach{view.addSubview($0)}
        
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20).isActive = true
        
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 20).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        
    }
    
    
    private func setupNavigationBar(){
        navigationItem.title = "Create Component"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "CANCEL", style: .plain, target: self, action: #selector(handleCancel))
    }

    @objc private func handleSave(){
        
        print("HANDLESAVE() called")
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
//        if component == nil {
            let tempComponent = NSEntityDescription.insertNewObject(forEntityName: "Component", into: context)
            tempComponent.setValue(nameTextField.text, forKey: "name")
        
//            delegate?.didAddComponent(myComponent: tempComponent as! Component)
        
        
//            self.dismiss(animated: true, completion: nil)
            self.dismiss(animated: true) {
                self.delegate?.didAddComponent(myComponent: tempComponent as! Component)
            }
//        }
    }

    @objc private func handleCancel(){ self.dismiss(animated: true, completion: nil)}
    
    
    //MARK:- Built-in Switch Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        view.backgroundColor = UIColor.lightBlue
        setupUI()
    }
}
