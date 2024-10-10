//
//  GameTableViewCell.swift
//  GameQuest
//
//  Created by Usama Waked on 2024-10-10.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    //MARK: Outlets
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gamePublisher: UILabel!
    @IBOutlet weak var gameDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
