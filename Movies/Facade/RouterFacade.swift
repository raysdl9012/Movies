//
//  RouterFacade.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 17/06/21.
//

import Foundation
import UIKit

class RouterFacade {
    
    static let instance = RouterFacade()
    
    let navController = UINavigationController()
    
    func getNavegationController() -> UINavigationController {
        return self.navController
    }
    
    func getHometView() -> UIViewController {
        let router =  HomeRouter.start()
        let inicialView = router.entry!
        return inicialView
    }
    
    func getHomeDetail(movie: Movie) -> UIViewController {
        let router = HomeDetailRouter()
        let vc = (router.start(movie: movie).entry)!
        return vc
    }
    
    func setRootViewController(view: UIViewController) {
        self.navController.viewControllers = [view]
    }
    
    func pushNavigationController(view: UIViewController) {
        self.navController.pushViewController(view, animated: true)
    }
    
    func backNavigationController() {
        self.navController.popViewController(animated: true)
    }
    
    func backNavigationController(to viewController: UIViewController) {
        self.navController.popToViewController(viewController, animated: true)
    }
}
