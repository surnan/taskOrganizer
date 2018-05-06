//
//  DailyTask + Operator Override.swift
//  taskOrganizer
//
//  Created by admin on 5/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import CoreData


extension DailyTask {
    
    //MARK:- Overloading
    static func == (lhs: DailyTask, rhs: DailyTask) -> Bool {
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "HH:mm"
        let leftSide = dateFormatter2.string(from: lhs.time!)
        let rightSide = dateFormatter2.string(from: rhs.time!)
        return leftSide == rightSide
    }
    
    static func < (lhs: DailyTask, rhs: DailyTask) -> Bool {
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "HH:mm"
        let leftSide = dateFormatter2.string(from: lhs.time!)
        let rightSide = dateFormatter2.string(from: rhs.time!)
        return leftSide < rightSide
    }
    
    static func <= (lhs: DailyTask, rhs: DailyTask) -> Bool {
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "HH:mm"
        let leftSide = dateFormatter2.string(from: lhs.time!)
        let rightSide = dateFormatter2.string(from: rhs.time!)
        return leftSide <= rightSide
    }
    
    static func > (lhs: DailyTask, rhs: DailyTask) -> Bool {
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "HH:mm"
        let leftSide = dateFormatter2.string(from: lhs.time!)
        let rightSide = dateFormatter2.string(from: rhs.time!)
        return leftSide > rightSide
    }
    
    static func >= (lhs: DailyTask, rhs: DailyTask) -> Bool {
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "HH:mm"
        let leftSide = dateFormatter2.string(from: lhs.time!)
        let rightSide = dateFormatter2.string(from: rhs.time!)
        return leftSide >= rightSide
    }
    
    
    
}
