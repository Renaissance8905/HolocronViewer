//
//  PersonDetail.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import Combine
import Holocron
import SwiftUI

struct PersonDetail: DetailView {
    
    private(set) var data: Person
    
    @ObservedObject var homeworld:   SWDataViewModel<Planet>
    @ObservedObject var films:       SWDataViewModel<[Film]>
    @ObservedObject var species:     SWDataViewModel<[Species]>
    @ObservedObject var vehicles:    SWDataViewModel<[Vehicle]>
    @ObservedObject var starships:   SWDataViewModel<[Starship]>
    
    init?(_ person: Person?) {
        guard let person = person else { return nil }
        self.data = person
        self.homeworld = SWDataViewModel(person.getHomeworld)
        self.films = SWDataViewModel(person.getFilms)
        self.species = SWDataViewModel(person.getSpecies)
        self.vehicles = SWDataViewModel(person.getVehicles)
        self.starships = SWDataViewModel(person.getStarships)
        
    }
    
    var body: some View {
            List {
                detailStack
                links
                
            }.navigationBarTitle(Text(data.name))
        
    }
    
    var detailStack: some View {
        VStack(alignment: .leading, spacing: 12) {
            DetailLabel("Born",         data.birthYear?.description, capitalize: false)
            DetailLabel("Eye Color",    data.eyeColor)
            DetailLabel("Gender",       data.gender)
            DetailLabel("Hair Color",   data.hairColor)
            DetailLabel("Skin Color",   data.skinColor)
            DetailLabel("Height",       data.height?.description(.centimeters), capitalize: false)
            DetailLabel("Mass",         data.mass?.description(.kilograms), capitalize: false)
        }
        
    }
    
    var links: some View {
        Group {
                LinkSection("Homeworld",
                               data: homeworld.object,
                               destination: PlanetDetail.self,
                               onFailure: homeworld.fetch)
                
                LinkSection("Films",
                               data: films.object,
                               destination: FilmDetail.self,
                               onFailure: films.fetch)
            
                LinkSection("Species",
                               data: species.object,
                               destination: SpeciesDetail.self,
                               onFailure: species.fetch)
                
                LinkSection("Starships",
                               data:starships.object,
                               destination: StarshipDetail.self,
                               onFailure: starships.fetch)
                
                LinkSection("Vehicles",
                               data: vehicles.object,
                               destination:  VehicleDetail.self,
                               onFailure: vehicles.fetch)
                

        }
        
    }
    
}

