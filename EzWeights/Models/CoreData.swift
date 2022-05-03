//
//  CoreData.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/27/22.
//

import CoreData
import Foundation

class CoreData: ObservableObject {
    var container: NSPersistentContainer
    
    init() {
        let dataContainer = NSPersistentContainer(name: "EzWeights")

        dataContainer.loadPersistentStores { storeDescription, error in
            dataContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        
        container = dataContainer
    }
    
    func loadRoutines() -> [Routine] {
        var routines = [Routine]()
        let request = Routine.createFetchRequest()
        
        do {
            routines = try container.viewContext.fetch(request)
        } catch {
            print("Fetch failed")
        }
        
        return routines
    }
    
    func loadRoutineModels() -> [RoutineModel] {
        let routines = loadRoutines()
        
        var routineModels = [RoutineModel]()
        for routine in routines {
            var exerciseModels = [ExerciseModel]()
            for item in routine.exercises {
                if let exercise = item as? Exercise {
                    let exerciseModel = ExerciseModel(name: exercise.name, sets: exercise.sets, reps: exercise.reps, weight: exercise.weight)
                    exerciseModels.append(exerciseModel)
                } else {
                    print("item in routine.exercise could not be converted to exercise")
                }
            }
            
            let routineModel = RoutineModel(name: routine.name, exercises: exerciseModels)
            routineModels.append(routineModel)
        }
        
        return routineModels
    }
    
    func upsertRoutine(routineModel: RoutineModel) {
        let routine = Routine(context: self.container.viewContext)
        routine.name = routineModel.name

        var exercises = [Exercise]()
        
        for exerciseModel in routineModel.exercises {
            let exercise = Exercise(context: self.container.viewContext)
            exercise.name = exerciseModel.name
            exercise.sets = exerciseModel.sets
            exercise.reps = exerciseModel.reps
            exercise.weight = exerciseModel.weight
            exercises.append(exercise)
            
            routine.addToExercises(exercise)

        }
        
        self.saveContext()
    }
    
    func deleteRoutineWithName(name: String) {
        let routines = loadRoutines()
        
        for routine in routines {
            if routine.name != name {
                continue
            }
            for item in routine.exercises {
                if let exercise = item as? Exercise {
                    container.viewContext.delete(exercise)
                } else {
                    print("item in routine.exercise could not be converted to exercise")
                }
            }
            container.viewContext.delete(routine)
        }
        self.saveContext()
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
}
