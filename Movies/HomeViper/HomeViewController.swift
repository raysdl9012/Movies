//
//  HomeViewController.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 14/06/21.
//

import UIKit


protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol? {get set}
    func updateMovies(with movies:AllMovie)
    func updateMoviesError(with error: Error)
}

class HomeViewController: UIViewController, HomeViewProtocol {
 
   
    var presenter: HomePresenterProtocol?
   
    private let cellIdentifire = "HomeTableViewCell"
    private var listMovies: AllMovie? {
        didSet {
            self.homeTableView.reloadData()
        }
    }

    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTableView()
        self.presenter?.interactorGetMovie()
        
    }
    
    private func loadTableView(){
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        self.homeTableView.loadCustomCell(cellIndentifire: self.cellIdentifire)
    }
    
    func updateMovies(with movies: AllMovie) {
        self.listMovies = movies
    }
   
    func updateMoviesError(with error: Error) {
        print("Error")
    }
    
    func showDetailMovie(movie:Movie) {
        self.presenter?.interactorGetMovieById(movie: movie)
    }
}


extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.listMovies?.results[indexPath.row]
        self.showDetailMovie(movie: movie!)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.listMovies != nil) ? self.listMovies!.results.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifire, for: indexPath) as! HomeTableViewCell
        cell.loadCell(movie: self.listMovies!.results[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}
