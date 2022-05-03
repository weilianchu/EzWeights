//
//  WorkoutViewModel.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/16/22.
//

import Foundation
import SwiftUI

class WorkoutViewModel: ObservableObject {
    var routine: RoutineModel
    var routineFinished = false
    @Published private var finishedExerciseNames: [String:Bool]
    
    init(currRoutine: RoutineModel) {
        routine = currRoutine
        finishedExerciseNames = [:]
    }
    
    var routineName: String {
        routine.name
    }
    
    var routineExercises: [ExerciseModel] {
        routine.exercises
    }
    
    func toggleExerciseComplete(name: String) {
        if let completed = finishedExerciseNames[name] {
            if completed {
                finishedExerciseNames[name] = false
            } else {
                finishedExerciseNames[name] = true
            }
        } else {
            finishedExerciseNames[name] = true
        }
        updateRoutineFinished()
    }
    
    func updateRoutineFinished() {
        for exercise in routine.exercises {
            if let completed = finishedExerciseNames[exercise.name] {
                if !completed {
                    routineFinished = false
                    return
                }
            } else {
                routineFinished = false
                return
            }
        }
        routineFinished = true
    }
    
    func colorForExerciseName(name: String) -> Color {
        if let completed = finishedExerciseNames[name] {
            return completed ? Colors.completed : Colors.button
        } else {
            return Colors.button
        }
    }
}
