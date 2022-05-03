//
//  Routine+CoreDataProperties.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/28/22.
//
//

import Foundation
import CoreData


extension Routine {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Routine> {
        return NSFetchRequest<Routine>(entityName: "Routine")
    }

    @NSManaged public var name: String
    @NSManaged public var exercises: NSSet

}

// MARK: Generated accessors for exercises
extension Routine {

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: Exercise)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: Exercise)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSSet)

}

extension Routine : Identifiable {

}
