//
//  WelcomeView.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/6/22.
//

import SwiftUI

struct WelcomeView: View {
    var viewModel = WelcomeViewModel()
    @EnvironmentObject var appState: AppState
    @State private var showConfirmationDialogue: Bool = false
    @State private var editIndex: Int = -1

    var body: some View {
        NavigationView{
            ZStack{
                Colors.background.ignoresSafeArea()
                VStack{
                    Text("Let's Work! 💪")
                        .foregroundColor(Colors.button)
                        .font(.largeTitle)
                    Spacer()
                    ForEach(0..<viewModel.routines.count, id: \.self) { index in
                        HStack{
                            NavigationLink(
                                destination: EditView(viewModel: EditViewModel(currRoutine: viewModel.routines[editIndex])),
                                label: {
                                    Text(viewModel.routines[index].name)
                                        .foregroundColor(Colors.text)
                                        .bold()
                                }
                            )
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Colors.button)
                            Button(
                                action: {
                                    showConfirmationDialogue = true
                                    editIndex = index
                                },
                                label: {Text("✏️")}
                            )
                                .padding()
                                .background(Colors.add)
                        }
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(
                            destination: EditView(viewModel: EditViewModel(currRoutine: RoutineModel(name: "", exercises: []))),
                            label: {
                                Text("+")
                                   .frame(width: 50, height: 50)
                                   .foregroundColor(Colors.text)
                                   .background(Colors.add)
                                   .clipShape(Circle())
                                   .padding()
                                   .font(.title)
                            }
                        )
                    }
                }
                .confirmationDialog(
                    "edit/delete workout",
                    isPresented: $showConfirmationDialogue
                ){
                    Button("Edit"){
                            viewModel.editTriggered = true
                    }
                    Button("Delete", role: .destructive){
                        viewModel.removeRoutine(idx: editIndex)
                    }
                }
                .background(
                    NavigationLink(
                        destination: EditView(viewModel: EditViewModel(currRoutine: viewModel.routines[editIndex])),
                        isActive: .constant(viewModel.editTriggered),
                        label: { EmptyView()}
                    )
                )
            }
            .id(appState.rootViewId)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
