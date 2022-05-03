//
//  RoutineButton.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/16/22.
//

import SwiftUI

struct RoutineButton: View {
    let nameText: String
    var body: some View {
        Button(action: {
            print(nameText)
        }, label: {
            Text(nameText)
                .foregroundColor(Colors.text)
                .bold()
        })
        .frame(maxWidth: .infinity)
        .padding()
        .background(Colors.button)
    }
}

struct RoutineButton_Previews: PreviewProvider {
    static var previews: some View {
        RoutineButton(nameText: "Push")
    }
}
