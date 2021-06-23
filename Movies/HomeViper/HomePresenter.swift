//
//  HomePresenter.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 15/06/21.
//

import Foundation


// Object
// Protocol
// Reference router, view, interactor


protocol HomePresenterProtocol {
    var router: HomeRouterProtocol? {get set}
    var interactor: HomeInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    func interactorGetMovie()
    func interactorGetMovieById(movie: Movie)
    func interactorDidFetchMovies(result: AllMovie)
    func interactorDidFetchMoviesError(error: Error)
}

class HomePresenter: HomePresenterProtocol {

    var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    var interactor: HomeInteractorProtocol? 
    
    func interactorGetMovie() {
        self.interactor?.getMovies()
    }
    
    func interactorDidFetchMovies(result: AllMovie) {
        DispatchQueue.main.async {
            self.view?.updateMovies(with: result)
        }
    }
    
    func interactorDidFetchMoviesError( error: Error) {
        self.view?.updateMoviesError(with: error)
    }
    
    func interactorGetMovieById(movie: Movie) {
        self.interactor?.getMovieById(id: "\(movie.id)")
    }
    
    

}
