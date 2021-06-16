//
//  AllMovie.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 14/06/21.
//

import Foundation


struct AllMovie: Codable {
    var page: Int
    var results: [Movie]
}
