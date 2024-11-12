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
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameDescription: UILabel!
    @IBOutlet weak var gameDeveloper: UILabel!
    //requirements
    @IBOutlet weak var gameOS: UILabel!
    @IBOutlet weak var gameProcessor: UILabel!
    @IBOutlet weak var gameMemory: UILabel!
    @IBOutlet weak var gameGraphics: UILabel!
    @IBOutlet weak var gameStorage: UILabel!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadUI()
        // Do any additional setup after loading the view.
        print(game)
    }
    
    //Load UI
    func loadUI() {
        gameImage.image = passedImage
        gameYear.text = "\(game.release_date ?? "")"
        gamePublisher.text = game.publisher
        gameDeveloper.text = game.developer
        gameTitle.text = game.title
        gameDescription.text = game.short_description
        gameOS.text = game.minimum_system_requirements?.os
        gameProcessor.text = game.minimum_system_requirements?.processor
        gameMemory.text = game.minimum_system_requirements?.memory
        gameGraphics.text = game.minimum_system_requirements?.graphics
        gameStorage.text = game.minimum_system_requirements?.storage
        
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
