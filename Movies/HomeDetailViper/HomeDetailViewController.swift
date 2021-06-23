//
//  HomeDetailViewController.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 17/06/21.
//

import UIKit

protocol HomeDetailViewProtocol {
    var presenter: HomeDetailPresenterProtocol? {get set}
}

class HomeDetailViewController: UIViewController, HomeDetailViewProtocol {
    
    var presenter: HomeDetailPresenterProtocol?
    
    @IBOutlet weak var posterPath: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var overviewMovie: UILabel!
    @IBOutlet weak var voteAverageMovie: UILabel!
    @IBOutlet weak var releaseDateMovie: UILabel!
    @IBOutlet weak var homePageMovie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---start!!!")
        
        self.cleanDataMovie()
        self.loadMovie(movie: self.presenter!.movie)
    }

    
    func loadMovie(movie:Movie) {
        self.overviewMovie.text = movie.overview
        self.titleMovie.text = movie.title
        self.voteAverageMovie.text = "\(movie.vote_average)"
        self.releaseDateMovie.text = movie.release_date
        self.homePageMovie.text = movie.homepage
        self.searchImageInCache(path: movie.poster_path)
    }
    
    func cleanDataMovie() {
        self.overviewMovie.text = ""
        self.titleMovie.text = ""
        self.voteAverageMovie.text = ""
        self.releaseDateMovie.text = ""
        self.homePageMovie.text = ""
        self.posterPath.image = nil
    }
    
    private func searchImageInCache(path: String){
        if let image = ManagerCache.instance.getImageFromCache(forKey: path) {
            self.posterPath?.image = image
        }
    }
}
