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


protocol AnyInteractor {

    var presenter: AnyPresenter? {get set}
    func getMovies()
}

class HomeInteractor: AnyInteractor {
   
    var presenter: AnyPresenter?
    
    func getMovies() {
        ManagerRequestServices.instance.getALLMovies { response, error in
            guard error == nil else{
                self.presenter?.interactorDidFetchMoviesError(error: error!)
                return
            }
            
            if let responseData = response as? AllMovie {
                self.presenter?.interactorDidFetchMovies(result: responseData)
            }
        }
    }
    
    
}
