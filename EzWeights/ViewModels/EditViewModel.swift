//
//  EditViewModel.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/18/22.
//

import Foundation
import SwiftUI

class EditViewModel: ObservableObject {
    @Published var inputs: [ExerciseModel] = []
    @Published var workoutName: String
    var dataStore = DataStore()
    var existingName: String
    
    init(currRoutine: RoutineModel) {
        existingName = currRoutine.name
        workoutName = currRoutine.name
        for exercise in currRoutine.exercises {
            inputs.append(ExerciseModel(name: exercise.name, sets: exercise.sets, reps: exercise.reps, weight: exercise.weight))
        }
    }
    
    func addExercise() {
        inputs.append(ExerciseModel(name: "", sets: 0, reps: 0, weight: 0))
    }
    
    func removeExercise(index: Int) {
        inputs.remove(at: index)
    }
    
    func flushRoutine() {
        dataStore.upsertRoutine(oldName: existingName, routine: RoutineModel(name: workoutName, exercises: inputs))
    }
}
