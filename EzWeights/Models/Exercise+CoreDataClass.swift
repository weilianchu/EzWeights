//
//  Exercise+CoreDataClass.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/28/22.
//
//

import Foundation
import CoreData

@objc(Exercise)
public class Exercise: NSManagedObject {

}
 
struct ExerciseModel {
    public var name: String
    public var sets: Int16
    public var reps: Int16
    public var weight: Int16
    
    init(name: String, sets: Int16, reps: Int16, weight: Int16) {
        self.name = name
        self.sets = sets
        self.reps = reps
        self.weight = weight
    }
}
