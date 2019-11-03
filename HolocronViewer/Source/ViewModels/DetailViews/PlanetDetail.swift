//
//  PlanetDetail.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import SwiftUI
import Combine
import Holocron

struct PlanetDetail: DetailView {
    
    private(set) var data: Planet
    
    @ObservedObject var residents:   SWDataViewModel<[Person]>
    @ObservedObject var films:       SWDataViewModel<[Film]>

    init?(_ planet: Planet?) {
        guard let planet = planet else { return nil }
        self.data = planet
        self.residents = SWDataViewModel(planet.getResidents)
        self.films = SWDataViewModel(planet.getFilms)
    }
        
    var body: some View {
        List {
            detailStack
            links
        }.navigationBarTitle(Text(data.name))
    }
    
    var detailStack: some View {
        VStack(alignment: .leading, spacing: 12) {
            DetailLabel("Diameter",         data.diameter?.description(.kilometers))
            DetailLabel("Rotation Period",  data.rotationPeriod?.description(.standardHours))
            DetailLabel("Orbital Period",   data.orbitalPeriod?.description(.standardDays))
            DetailLabel("Gravity",          data.gravity)
            DetailLabel("Population",       data.population?.description())
            DetailLabel("Climate",          data.climate.linePer)
            DetailLabel("Terrain",          data.terrain.linePer)
            DetailLabel("Surface Water",    data.surfaceWater?.description(.percentage))
            
        }

    }
    
    var links: some View {
        Group {
            LinkSection("Residents",
                           data: residents.object,
                           destination: PersonDetail.self,
                           onFailure: residents.fetch)

            LinkSection("Films",
                           data: films.object,
                           destination: FilmDetail.self,
                           onFailure: films.fetch)

            
        }
        
    }
    
}
