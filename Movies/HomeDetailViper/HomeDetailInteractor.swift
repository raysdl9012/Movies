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


protocol HomeDetailInteractorProtocol {

    var presenter: HomeDetailPresenterProtocol? {get set}    
}

class HomeDetailInteractor: HomeDetailInteractorProtocol {
  
    var presenter: HomeDetailPresenterProtocol?
    
}
