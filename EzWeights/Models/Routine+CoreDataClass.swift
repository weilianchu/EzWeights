//
//  Routine+CoreDataClass.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/28/22.
//
//

import Foundation
import CoreData

@objc(Routine)
public class Routine: NSManagedObject {

}

struct RoutineModel {
    public var name: String
    public var exercises: [ExerciseModel]
    
    init(name: String, exercises: [ExerciseModel]) {
        self.name = name
        self.exercises = exercises
    }
}
