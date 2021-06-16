//
//  HomeViewController.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 14/06/21.
//

import UIKit


protocol AnyView {
    var presenter: AnyPresenter? {get set}
    func updateMovies(with movies:AllMovie)
    func updateMoviesError(with error: Error)
}

class HomeViewController: UIViewController, AnyView {
 
   
    
    
    var presenter: AnyPresenter?
    

    private let cellIdentifire = "HomeTableViewCell"
    private var listMovies: AllMovie? {
        didSet {
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        }
    }

    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTableView()
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
    
}


extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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
