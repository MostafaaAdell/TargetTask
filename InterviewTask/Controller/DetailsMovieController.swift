//
//  DetailsMovieController.swift
//  InterviewTask
//
//  Created by Mustafa on 07/07/2023.
//

import UIKit
import SDWebImage

class DetailsMovieController: UIViewController {

    @IBOutlet weak var detailsImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    var movieDetails:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor(named: "NearlyBlue")
        
        titleLabel.text = movieDetails?.title
        if let rate = movieDetails?.rating{
            ratingLabel.text = "\(rate)"
        }
        if let year = movieDetails?.year{
            yearLabel.text = "\(year)"
            
        }
        
        let url = URL(string: (movieDetails?.thumbnail)!)
        detailsImage.sd_setImage(with: url , completed: nil)
        
        

        
        // Do any additional setup after loading the view.
    }
    

}
