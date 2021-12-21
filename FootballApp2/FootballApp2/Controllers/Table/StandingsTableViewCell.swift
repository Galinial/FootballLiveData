//
//  StandingsTableViewCell.swift
//  FootballApp2
//
//  Created by gal linial on 18/12/2021.
//

import UIKit

class StandingsTableViewCell: UITableViewCell {
    @IBOutlet weak var cardBackgroundView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var GDLabel: UILabel!
    @IBOutlet weak var formLabel: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        settingBackground()
    }


    func populate(details:standingsDetails){
        
        details.team.logo.downloadImage(to: teamImage)
        self.nameLabel.text = "Club - " + String(details.team.name)
        self.positionLabel.text = "Position - " + String(details.rank)
        self.positionLabel.text = "Points - " + String(details.points)
        self.GDLabel.text = "GD - " + String(details.goalsDiff)
        self.formLabel.text = "Form - " + String(details.form)
    }

    func settingBackground(){
        cardBackgroundView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        cardBackgroundView.layer.cornerRadius = 5.0
        cardBackgroundView.layer.masksToBounds = false
        cardBackgroundView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        cardBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardBackgroundView.layer.shadowOpacity = 0.8
        
    }
}
