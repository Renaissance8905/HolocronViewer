//
//  ContentView.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/12/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObservedObject var people = PeopleViewModel()
    
    private var navTitle = Text("The Holocron")
    
    var body: some View {
        NavigationView {
            if people.loaded {
                PersonListView(people.people, title: navTitle)

            } else {
                LoadingScreen(navTitle)
                
            }

        }
        
    }
    
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
