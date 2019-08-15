//
//  SpeciesDetail.swift
//  HolocronSPMTester
//
//  Created by Chris Spradling on 8/14/19.
//  Copyright © 2019 Chris Spradling. All rights reserved.
//

import Combine
import Holocron
import SwiftUI

struct SpeciesDetail: DetailView {
    
    private(set) var data: Species
    
    @ObjectBinding var people:      SWDataViewModel<[Person]>
    @ObjectBinding var films:       SWDataViewModel<[Film]>
    @ObjectBinding var homeworld:   SWDataViewModel<Planet>
    
    init?(_ species: Species?) {
        guard let species = species else { return nil }
        self.data = species
        self.people = SWDataViewModel(species.getPeople)
        self.films = SWDataViewModel(species.getFilms)
        self.homeworld = SWDataViewModel(species.getHomeworld)
        
    }
    
    var body: some View {
        List {
            detailStack
            links
        }.navigationBarTitle(data.name)
        
    }
    
    var detailStack: some View {
        VStack(alignment: .leading, spacing: 12) {
            DetailLabel("Classification",   data.classification)
            DetailLabel("Designation",      data.designation)
            DetailLabel("Average Height",   data.averageHeight?.description(.centimeters))
            DetailLabel("Average Lifespan", data.averageLifespan?.description(.standardYears))
            DetailLabel("Eye Colors",       data.eyeColors.linePer)
            DetailLabel("Hair Colors",      data.hairColors.linePer)
            DetailLabel("Skin Colors",      data.skinColors.linePer)
            DetailLabel("Language",         data.language)
        }

    }
    
    var links: some View {
        Group {
            LinkSection("Homeworld",
                           data: homeworld.object,
                           destination: PlanetDetail.self,
                           onFailure: homeworld.fetch)
            
            LinkSection("Members",
                           data: people.object,
                           destination: PersonDetail.self,
                           onFailure: people.fetch)
            
            LinkSection("Films",
                           data: films.object,
                           destination: FilmDetail.self,
                           onFailure: films.fetch)
            
        }
        
    }

}
