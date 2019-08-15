//
//  VehicleDetail.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import Combine
import Holocron
import SwiftUI

struct VehicleDetail: DetailView {
    
    private(set) var data: Vehicle
    
    @ObjectBinding var films:   SWDataViewModel<[Film]>
    @ObjectBinding var pilots:  SWDataViewModel<[Person]>
    
    init?(_ ship: Vehicle?) {
        guard let ship = ship else { return nil }
        self.data = ship
        self.films = SWDataViewModel(ship.getFilms)
        self.pilots = SWDataViewModel(ship.getPilots)
    }
    
    var cost: String? {
        guard let credits = data.costInCredits?.description() else { return nil }
        return credits + " Credits"
    }
    
    var atmoSpeed: String? {
        guard let speed = data.maxAtmospheringSpeed?.description() else { return nil }
        return speed + " kph"
    }
    
    
    var body: some View {
        List {
            detailStack
            links
        }.navigationBarTitle(Text(data.name))
        
    }
    
    var detailStack: some View {
        VStack(alignment: .leading, spacing: 12) {
            DetailLabel("Vehicle Class",                data.vehicleClass)
            
            Group {
                DetailLabel("Model",                    data.model)
                DetailLabel("Length",                   data.length?.description(.meters), capitalize: false)
                DetailLabel("Cost",                     cost)
                DetailLabel("Crew",                     data.crew?.description(), capitalize: false)
                DetailLabel("Passengers",               data.passengers?.description(), capitalize: false)
                DetailLabel("Cargo Capacity",           data.cargoCapacity?.description(.kilograms))
                DetailLabel("Consumables",              data.consumables)
                DetailLabel("Max Atmosphering Speed",   atmoSpeed)

            }

            DetailLabel("Manufacturer",                 data.manufacturer)

        }
        
    }
    
    var links: some View {
        Group {
            LinkSection("Films",
                           data: films.object,
                           destination: FilmDetail.self,
                           onFailure: films.fetch)
            
            LinkSection("Pilots",
                           data: pilots.object,
                           destination: PersonDetail.self,
                           onFailure: pilots.fetch)
            
        }
        
    }
    
}
