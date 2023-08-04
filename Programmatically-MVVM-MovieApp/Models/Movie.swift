//
//  Movie.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Ozkan on 24.11.2022.
//

import Foundation

struct Movie: Decodable{
    let results: [MovieResult]?
}
struct MovieResult: Decodable{
    let id: Int?
    let posterPath: String?
    let overview, releaseDate, title: String?
    
    enum CodingKeys: String, CodingKey{
        case id
        case posterPath = "poster_path"
        case overview, title
        case releaseDate = "release_date"
    }
    
    var _id: Int {
        id ?? Int.min
    }
    
    var _posterPath: String {
        posterPath ?? ""
    }
}
