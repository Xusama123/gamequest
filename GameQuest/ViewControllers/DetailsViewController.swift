//
//  DetailsViewController.swift
//  GameQuest
//
//  Created by Usama Waked on 2024-10-10.
//

import UIKit

class DetailsViewController: UIViewController {

    //MARK: Properties
    var game: Game!
    var passedImage: UIImage!
    
    //MARK: Outlets
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameYear: UILabel!
    @IBOutlet weak var gameGenre: UILabel!
    @IBOutlet weak var gamePublisher: UILabel!
    
    @IBOutlet weak var gameDeveloper: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        // Do any additional setup after loading the view.
    }
    
    //Load UI
    func loadUI() {
        gameImage.image = passedImage
        gameYear.text = "\(game.release_date ?? "")"
        gameGenre.text = game.genre
        gamePublisher.text = game.publisher
        gameDeveloper.text = game.developer
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
