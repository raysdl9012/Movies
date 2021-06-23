//
//  HomeRouter.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 15/06/21.
//

import Foundation
import UIKit

// Object
// Entry point

typealias EntryPointHome = HomeViewProtocol & UIViewController

protocol HomeRouterProtocol {
    var entry: EntryPointHome? {get}
    func changeViewToDetailMovie(movie: Movie)
    static func start() -> HomeRouterProtocol
}


class HomeRouter: HomeRouterProtocol {
  
    
    var entry: EntryPointHome?
    static func start() -> HomeRouterProtocol {
        let router = HomeRouter()
        
        var view: HomeViewProtocol =  HomeViewController.loadFromNib()
        var presenter: HomePresenterProtocol = HomePresenter()
        var interactor: HomeInteractorProtocol = HomeInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.entry =  view as? EntryPointHome
        
        return router
    }
    
    func changeViewToDetailMovie(movie: Movie) {
        let vc = RouterFacade.instance.getHomeDetail(movie: movie)
        DispatchQueue.main.async {
            RouterFacade.instance.pushNavigationController(view: vc)
        }
    }
    
}

