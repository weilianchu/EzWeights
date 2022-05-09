//
//  Exercise+CoreDataClass.swift
//  EzWeights
//
//  Created by Weilian Chu on 5/8/22.
//
//

import Foundation
import CoreData

@objc(Exercise)
public class Exercise: NSManagedObject {

}

struct ExerciseModel {
    public var name: String
    public var log: String
    public var weight: Int16
    
    init(name: String, weight: Int16, log: String) {
        self.name = name
        self.weight = weight
        self.log = log
    }
}
