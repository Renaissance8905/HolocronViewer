//
//  DetailLabel.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import SwiftUI

struct DetailLabel: View {
    
    var label: String
    var value: String

    var body: some View {
        HStack(alignment: .center) {
            Text(label + ":").bold()
            Text(value).font(.body).italic()
        }
    }
    
    init?(_ label: String, _ value: String?, capitalize: Bool = true) {
        guard let value = value else { return nil }
        self.label = label
        self.value = capitalize ? value.capitalized : value
    }
    
}
