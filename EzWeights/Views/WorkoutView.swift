//
//  WorkoutView.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/16/22.
//

import SwiftUI

struct WorkoutView: View {
    @Environment(\.presentationMode) var presentation
    @StateObject var viewModel: WorkoutViewModel
    @EnvironmentObject var appState: AppState
    @State private var activateLinkToEditView: Bool = false
    
    var body: some View {
        ZStack{
            Colors.background.ignoresSafeArea()
            VStack{
                Text("\(viewModel.routineName) Workout")
                    .foregroundColor(Colors.button)
                    .font(.largeTitle)
                Spacer()
                ForEach(viewModel.routineExercises, id: \.self.name) { exercise in
                    Button(
                        action: {
                            viewModel.toggleExerciseComplete(name: exercise.name)
                        },
                        label: {
                            Text("\(exercise.name) - \(exercise.sets) x \(exercise.reps) @ \(exercise.weight)lb")
                                .foregroundColor(Colors.text)
                                .bold()
                        }
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(viewModel.colorForExerciseName(name: exercise.name))
                }
                Spacer()
            }.confirmationDialog(
                "Nice work! Adjust exercises for next time?",
                isPresented: $viewModel.routineFinished,
                titleVisibility: .visible
            ){
                Button("Yes, edit workout"){
                    activateLinkToEditView = true
                }
                Button("No, finish workout", role: .cancel){
                    appState.rootViewId = UUID()
                }
            }
        }
        .background(
            NavigationLink(
                destination: EditView(viewModel: EditViewModel(currRoutine: viewModel.routine)),
                isActive: .constant(activateLinkToEditView),
                label: { EmptyView()}
            )
        )
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(viewModel: WorkoutViewModel(currRoutine: RoutineModel(name: "Push", exercises: [
            ExerciseModel(name: "Inclined Press", sets: 5, reps: 8, weight: 80),
            ExerciseModel(name: "Arnold Press", sets: 3, reps: 8, weight: 40),
            ExerciseModel(name: "Skiiers", sets: 3, reps: 8, weight: 30),
        ])))
    }
}
