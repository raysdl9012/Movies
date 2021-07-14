//
//  ManagerRequestServices.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 14/06/21.
//

import Foundation
import UIKit


class ManagerRequestServices {
    
    static let instance = ManagerRequestServices()
    
    func getALLMovies(completion: @escaping COMPLETION_DATA)  {
        ManagerRequest.instance.makeRequest(method: .GET,
                                            baseUrl: .BASE_URL,
                                            endpoint: .NOW_PLAYING,
                                            params: "",
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
                                            params: id + "",
                                            body: nil) { data, error in
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard let movie = self.convertMovie(data: data!) else {
                completion(nil, nil)
                return
            }
            completion(movie,error)
        }
    }
    
    func getImageByPosterPath(posterPath: String, completion: @escaping COMPLETION_DATA) {
        
        ManagerRequest.instance.downloadImage(from: posterPath) { (data, error) in
            guard error == nil, data != nil else {
                completion(nil, error)
                return
            }
            let image = self.convertDataToImage(data: data as! Data)
            completion(image,nil)
        }
    }
        
    private func convertDataToImage(data:Data) -> UIImage? {
        guard let image = UIImage(data: data) else {
            return nil
        }
        return image
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
