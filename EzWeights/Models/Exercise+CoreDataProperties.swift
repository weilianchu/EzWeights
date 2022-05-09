//
//  Exercise+CoreDataProperties.swift
//  EzWeights
//
//  Created by Weilian Chu on 5/8/22.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var name: String
    @NSManaged public var weight: Int16
    @NSManaged public var log: String
}

extension Exercise : Identifiable {

}
