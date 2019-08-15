//
//  LinkSection.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import SwiftUI

struct LinkSection<T: Identifiable, D: DetailView>: View where D.DataType == T {
    
    private(set) var data: [T]
    var header: Text
    var destination: D.Type
    
    init?(_ header: String, data: T?, destination: D.Type, onFailure: @escaping () -> Void = {}) {
        guard let data = data else {
            onFailure()
            return nil
        }
        
        self.init(header, data: [data], destination: destination, onFailure: onFailure)
    }
    
    init?(_ header: String, data: [T]?, destination: D.Type, onFailure: @escaping () -> Void = {}) {
        guard let data = data else {
            onFailure()
            return nil
        }
        
        guard !data.isEmpty else { return nil }
        
        self.data = data
        self.header = Text(header)
        self.destination = destination
        
    }
    
    var body: some View {
        Section(header: header) {
            
            ForEach(data) { item in
                
                NavigationLink(destination: self.destination.init(item)) {
                    
                    Text(item.name).offset(x: 8)
                    
                }
                
            }
            
        }
        
    }
    
}

