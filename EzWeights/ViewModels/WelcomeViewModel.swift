//
//  WelcomeViewModel.swift
//  EzWeights
//
//  Created by Weilian Chu on 4/16/22.
//

import Foundation
import SwiftUI

class WelcomeViewModel: ObservableObject {
    public var data = DataStore()
    public var editTriggered = false
    
    var routineNames: [String] {
        var names: [String] = []
        for routine in data.allRoutines {
            names.append(routine.name)
        }
        return names
    }
    
    var routines: [RoutineModel] {
        data.allRoutines
    }
    
    func removeRoutine(idx: Int) {
        data.deleteRoutineAtIndex(idx: idx)
    }
}
