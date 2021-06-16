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

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? {get}
    static func start() -> AnyRouter
}


class HomeRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        // Crear todo los componentes de VIPER
        let router = HomeRouter()
        var view: AnyView =  HomeViewController()
        var presenter: AnyPresenter = HomePresenter()
        var interactor: AnyInteractor = HomeInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        
        router.entry =  view as? EntryPoint
        
        return router
    }
}
