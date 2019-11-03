//
//  FilmDetail.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import Combine
import Holocron
import SwiftUI

struct FilmDetail: DetailView {
    
    private(set) var data: Film
    
    @ObservedObject var species:     SWDataViewModel<[Species]>
    @ObservedObject var vehicles:    SWDataViewModel<[Vehicle]>
    @ObservedObject var characters:  SWDataViewModel<[Person]>
    @ObservedObject var planets:     SWDataViewModel<[Planet]>
    @ObservedObject var starships:   SWDataViewModel<[Starship]>

    var body: some View {
        List {
            detailStack
            
            Section(header: Text("Opening Crawl")) {
                Text(data.openingCrawl)
            }
            
            links
            
        }.navigationBarTitle(Text(data.name))
                
    }
    
    init?(_ film: Film?) {
        guard let film = film else { return nil }
        self.data = film
        self.species = SWDataViewModel(film.getSpecies)
        self.vehicles = SWDataViewModel(film.getVehicles)
        self.characters = SWDataViewModel(film.getCharacters)
        self.planets = SWDataViewModel(film.getPlanets)
        self.starships = SWDataViewModel(film.getStarships)
        
    }
    
    var detailStack: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            DetailLabel("Episode",      String(data.episodeId))
            DetailLabel("Director",     data.director.linePer)
            DetailLabel("Producer",     data.producer.linePer)
            DetailLabel("Release Date", data.releaseDateString)
            
        }
        
    }
    
    var links: some View {
        Group {
            LinkSection("Species",
                           data: species.object,
                           destination: SpeciesDetail.self,
                           onFailure: species.fetch)
            
            LinkSection("Vehicles",
                           data: vehicles.object,
                           destination:  VehicleDetail.self,
                           onFailure: vehicles.fetch)
            
            LinkSection("Starships",
                           data:starships.object,
                           destination: StarshipDetail.self,
                           onFailure: starships.fetch)
            
            LinkSection("Characters",
                           data: characters.object,
                           destination: PersonDetail.self,
                           onFailure: characters.fetch)
            
            LinkSection("Planets",
                           data: planets.object,
                           destination: PlanetDetail.self,
                           onFailure: planets.fetch)
            
        }
        
    }
    
}


