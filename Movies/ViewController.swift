//
//  ViewController.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 12/06/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ManagerRequestServices.instance.getALLMovies { success, data, error in
           
            if let movies = data as? AllMovie {
                print(movies)
            }
        }
    }
    
    
    func convertMovies(data:Data) -> AllMovie? {
        var movies:AllMovie?
        do {
            movies = try JSONDecoder().decode(AllMovie.self, from: data)
        } catch  {
            print("Error \(error)")
        }
        return movies
    }


}

