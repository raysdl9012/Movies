//
//  HomeInteractor.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 15/06/21.
//

import Foundation

// Object
// protocol
// Reference to presenter


protocol HomeInteractorProtocol {

    var presenter: HomePresenterProtocol? {get set}
    func getMovies()
    func getMovieById(id: String)
}

class HomeInteractor: HomeInteractorProtocol {

    var presenter: HomePresenterProtocol?
    
    func getMovies() {
        ManagerRequestServices.instance.getALLMovies {  response, error in
            guard error == nil else{
                self.presenter?.interactorDidFetchMoviesError(error: error!)
                return
            }
            
            if let responseData = response as? AllMovie {
                self.presenter?.interactorDidFetchMovies(result: responseData)
            }
        }
    }
    
    func getMovieById(id: String) {
        print(id)
        ManagerRequestServices.instance.getMovieById(id: id) { [weak self] (response, error) in
            guard error == nil else{
                self?.presenter?.interactorDidFetchMoviesError(error: error!)
                return
            }
            print(response)
            if let responseData = response as? Movie {
                self?.presenter?.router?.changeViewToDetailMovie(movie: responseData)
            }
        }
    }
    

}
