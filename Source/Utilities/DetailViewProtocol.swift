//
//  DetailViewProtocol.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import Holocron
import SwiftUI

protocol DetailView: View {
    associatedtype DataType: SWData
    
    var data: DataType { get }
    
    init?(_: DataType?)
    
}
