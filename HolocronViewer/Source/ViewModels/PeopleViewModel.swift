//
//  PeopleViewModel.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import SwiftUI
import Combine
import Holocron

class PeopleViewModel: ObservableObject {
    
    private(set) var loaded = false
    @Published var people: [Person] = []
    
    init() {
        SWAPI.shared.getPeople(limit: 100) { [weak self] (result) in
            
            if case .success(let people) = result {
                
                DispatchQueue.main.async {
                    
                    self?.loaded = true
                    self?.people = people.sorted(by: { $0.name < $1.name })
                    
                }
                
            }
            
        }
        
    }
    
}
