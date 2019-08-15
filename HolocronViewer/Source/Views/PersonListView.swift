//
//  PersonListView.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import Holocron
import SwiftUI

struct PersonListView: View {
    
    struct PersonRow: View {
        var person: Person
            
        var body: some View {
            VStack(alignment: .leading) {
                Text(person.name).bold()
                Text(person.birthYear?.description ?? "--").font(.caption)
                
            }
            
        }
            
    }

    var people: [Person]
    var navTitle: Text
    
    var body: some View {
        List(people) { person in
            
            NavigationLink(destination: PersonDetail(person)) {
                
                PersonRow(person: person)
                
            }
            
        }.navigationBarTitle(navTitle)

    }
    
    init(_ people: [Person], title: Text) {
        self.people = people
        self.navTitle = title
        
    }
    
}



