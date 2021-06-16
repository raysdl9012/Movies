//
//  Movie.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 14/06/21.
//

import Foundation


struct Movie: Codable {
 
    var title: String
    var status: String?
    var vote_count: Int
    var vote_average: Float
    var overview: String
    var release_date: String
    var id: Int
    var backdrop_path: String
    var homepage: String?
    var poster_path: String
    
}
