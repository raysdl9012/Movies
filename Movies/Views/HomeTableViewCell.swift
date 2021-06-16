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

        // Configure the view for the selected state
    }
    
    
    public func loadCell(movie: Movie){
        self.cleanData()
        self.overviewMovie.text = movie.overview
        self.titleMovie.text =  movie.title
    }
    
    private func cleanData(){
        self.posterImageMovie.image = nil
        self.titleMovie.text = ""
        self.overviewMovie.text = ""
    }
}
