//
//  ArrayJoinHelpers.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

extension Array where Element == String {
    
    var csv: String {
        return joined(separator: ", ")
    }
    
    var linePer: String {
        return joined(separator: "\n")
    }
    
}
