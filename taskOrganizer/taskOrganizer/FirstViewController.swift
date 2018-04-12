//
//  FirstViewController.swift
//  taskOrganizer
//
//  Created by admin on 4/11/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    func setupNavigationBar(){
        self.navigationItem.title = "HELLO WORLD"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "*RIGHT*", style: .plain, target: self, action: #selector(handleRight))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "*LEFT*", style: .plain, target: self, action: #selector(handleLeft))
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        setupNavigationBar()

    }
    
    
    @objc func handleRight(){
        print("click**")
    }

    @objc func handleLeft(){
        print("**click")
    }

    
    
}
