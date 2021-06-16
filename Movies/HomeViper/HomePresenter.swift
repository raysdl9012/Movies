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


protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidFetchMovies(result: AllMovie)
    func interactorDidFetchMoviesError(error: Error)
}

class HomePresenter: AnyPresenter {
   
    
  
    
    
    
    var view: AnyView?
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet {
            self.interactor?.getMovies()
        }
    }
    
    func interactorDidFetchMovies(result: AllMovie) {
        self.view?.updateMovies(with: result)
            
    }
    
    func interactorDidFetchMoviesError( error: Error) {
        self.view?.updateMoviesError(with: error)
    }

 
    
}
