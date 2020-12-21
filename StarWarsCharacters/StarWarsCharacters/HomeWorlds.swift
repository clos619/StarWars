//
//  HomeWorlds.swift
//  StarWarsCharacters
//
//  Created by Field Employee on 12/21/20.
//

import Foundation

struct HomeWorld : Decodable{
    let name: String
    let climate: String
    let population: String
    let terrain: String
    
//    enum CodingKeys: String,CodingKey{
//        case name
//        case climate
//        case population
//        case terrain
//    }
}
