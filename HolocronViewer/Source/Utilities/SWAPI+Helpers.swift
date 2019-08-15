//
//  SWAPI+Helpers.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import Holocron

typealias FetchBlock<T:Codable> = (SWAPI, @escaping (Result<T, SWError>) -> Void) -> Void

extension SWAPI {

    func optimistic<T>(_ block: @escaping FetchBlock<T>, _ success: @escaping (T) -> Void) {
        block(self) {
            
            guard case .success(let data) = $0 else { return }
            success(data)
            
        }
    }
    
}
