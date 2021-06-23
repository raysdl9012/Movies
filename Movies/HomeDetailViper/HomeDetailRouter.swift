//
//  HomeRouter.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 15/06/21.
//

import Foundation
import UIKit


typealias EntryPointHomeDetail = HomeDetailViewProtocol & UIViewController

protocol HomeDetailRouterProtocol {
    var entry: EntryPointHomeDetail? {get}
    func start(movie:Movie) -> HomeDetailRouterProtocol
}


class HomeDetailRouter: HomeDetailRouterProtocol {
    
    var entry: EntryPointHomeDetail?
    func start(movie: Movie) -> HomeDetailRouterProtocol {

        let router = HomeDetailRouter()
        var view: HomeDetailViewProtocol =  HomeDetailViewController()
        var presenter: HomeDetailPresenterProtocol = HomeDetailPresenter(movie: movie)
        var interactor: HomeDetailInteractorProtocol = HomeDetailInteractor()

        view.presenter = presenter

        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.entry =  view as? EntryPointHomeDetail

        return router
    }
}
