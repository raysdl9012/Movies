//
//  ManagerRequestServices.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 14/06/21.
//

import Foundation


class ManagerRequestServices {
    static let instance = ManagerRequestServices()
    
    func getALLMovies(completion: @escaping COMPLETION_DATA)  {
        ManagerRequest.instance.makeRequest(method: .GET,
                                            baseUrl: .BASE_URL,
                                            endpoint: .NOW_PLAYING,
                                            params: "?api_key=d760e019de605eee41529938d662657c",
                                            body: nil) { data, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let movies = self.convertMovies(data: data!) else {
                return
            }
            completion(movies,error)
        }
    }
    
    func getMovieById(id: String, completion: @escaping COMPLETION_DATA)  {
        ManagerRequest.instance.makeRequest(method: .GET,
                                            baseUrl: .BASE_URL,
                                            endpoint: .MOVIE  ,
                                            params: id + "?api_key=d760e019de605eee41529938d662657c",
                                            body: nil) { data, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let movie = self.convertMovie(data: data!) else {
                return
            }
            completion(movie,error)
        }
    }
    
    func getImageByPosterPath(posterPath: String, completion: @escaping COMPLETION_DATA) {
        ManagerRequest.instance.downloadImage(from: posterPath) { (data, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            completion(data,nil)
        }
    }
    
    private func convertMovies(data:Data) -> AllMovie? {
        var movies:AllMovie?
        do {
            movies = try JSONDecoder().decode(AllMovie.self, from: data)
        } catch  {
            print("Error \(error)")
        }
        return movies
    }
    
    private func convertMovie(data:Data) -> Movie? {
        var movies:Movie?
        do {
            movies = try JSONDecoder().decode(Movie.self, from: data)
        } catch  {
            print("*** Error \(error)")
        }
        return movies
    }
}
