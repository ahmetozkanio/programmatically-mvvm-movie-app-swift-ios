//
//  MovieService.swift
//  Programmatically-MVVM-MovieApp
//
//  Created by Ahmet Ozkan on 24.11.2022.
//

import Foundation

class MovieService{
    func downloadMovies(page: Int, _ completion: @escaping([MovieResult]?) -> ()){
        guard let url = URL(string: APIURLs.movies(page: page)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    func downloadDetail(id: Int, completion:  @escaping(MovieResult?) -> ()) {
        guard let url = URL(string: APIURLs.detail(id: id)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    private func handleWithData(_ data: Data) -> [MovieResult]?{
        
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        } catch  {
            print(error)
            return nil
        }
    }
    private func handleWithData(_ data: Data) -> MovieResult?{
        
        do {
            let movieDetail = try JSONDecoder().decode(MovieResult.self, from: data)
            return movieDetail
        } catch  {
            print(error)
            return nil
        }
    }
    private func handleWithError(_ error: Error){
        print(error.localizedDescription)
    }
    
}
