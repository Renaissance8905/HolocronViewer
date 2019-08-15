//
//  LoadingScreen.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import SwiftUI

struct LoadingScreen: View {
    private var navTitle: Text
    
    var body: some View {
        VStack {
            Text("Loading...")
            
        }.navigationBarTitle(navTitle)

    }
    
    init(_ navTitle: Text) {
        self.navTitle = navTitle
        
    }
    
}
