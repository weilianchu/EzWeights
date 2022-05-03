//
//  Exercise+CoreDataProperties.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/28/22.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var name: String
    @NSManaged public var reps: Int16
    @NSManaged public var sets: Int16
    @NSManaged public var weight: Int16
    @NSManaged public var routine: Routine?

}

extension Exercise : Identifiable {

}
