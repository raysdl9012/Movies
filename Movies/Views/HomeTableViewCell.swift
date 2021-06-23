//
//  HomeTableViewCell.swift
//  Movies
//
//  Created by Reinner Daza Leiva on 14/06/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var posterImageMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var overviewMovie: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    public func loadCell(movie: Movie){
        self.cleanData()
        self.overviewMovie.text = movie.overview
        self.titleMovie.text =  movie.title
        self.searchImageInCache(path: movie.poster_path)
    }
    
    private func cleanData(){
        self.posterImageMovie.image = nil
        self.titleMovie.text = ""
        self.overviewMovie.text = ""
    }
    
    private func searchImageInCache(path: String){
        if let image = ManagerCache.instance.getImageFromCache(forKey: path) {
            self.posterImageMovie?.image = image
            
        }else{
            self.downloadImage(path: path)
        }
    }
    
    private func downloadImage(path: String){
        
        // [weak self] Liberar Retencion de ciclos
        
        ManagerRequestServices.instance.getImageByPosterPath(posterPath: path) { [weak self]  (data, error) in
            guard error == nil else{
                print("Error \(error!)")
                return
            }
            
            if let image = UIImage(data: data! as! Data) {
                DispatchQueue.main.async {
                    ManagerCache.instance.saveImageInCache(image: image, forKey: path)
                    self!.posterImageMovie?.image = image
                }
            }
        }
    }
}
