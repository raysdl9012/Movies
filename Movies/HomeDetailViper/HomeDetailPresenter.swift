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


protocol HomeDetailPresenterProtocol {
    
    var movie : Movie {get set}
    var view: HomeDetailViewProtocol? {get set}
    var router: HomeDetailRouterProtocol? {get set}
    var interactor: HomeDetailInteractorProtocol? {get set}

}

class HomeDetailPresenter : HomeDetailPresenterProtocol {
   
    var movie: Movie
    var view: HomeDetailViewProtocol?
    var router: HomeDetailRouterProtocol?
    var interactor: HomeDetailInteractorProtocol?
    
    init(movie: Movie) {
        self.movie = movie
    }
}
