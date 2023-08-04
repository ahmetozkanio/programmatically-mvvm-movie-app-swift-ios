//
//  APIURLs.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Ozkan on 24.11.2022.
//

import Foundation


enum APIURLs{
    static func movies(page: Int) -> String{
        "https://api.themoviedb.org/3/movie/popular?api_key=2faa2bdda699f241a1e3e8d7c9effaa1&language=en-US&page=\(page)"
    }
    
    static func imageURL(posterPath: String) -> String{
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func detail(id: Int) -> String{
        "https://api.themoviedb.org/3/movie/\(id)?api_key=2faa2bdda699f241a1e3e8d7c9effaa1&language=en-US"
    }
}
