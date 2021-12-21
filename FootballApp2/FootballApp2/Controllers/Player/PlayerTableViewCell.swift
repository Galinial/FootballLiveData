//
//  PlayerTableViewCell.swift
//  FootballApp2
//
//  Created by gal linial on 07/12/2021.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nationality: UILabel!
    
    @IBOutlet weak var backgroundCardView: UIView!
    @IBOutlet weak var playerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingBackgroundCard()
    }

  
    
    func populate(player:PlayerResponse) {
        let details = player.details
        let statisticts = player.getStatisticts()
        self.age.text = "age: " + String(details.age)
        self.name.text = "name: " + details.name
        self.nationality.text = "nationality: " + details.nationality
        details.photo.downloadImage(to: playerImage)
    
    }
    
    func settingBackgroundCard(){
        backgroundCardView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        backgroundCardView.layer.cornerRadius = 5.0
        backgroundCardView.layer.masksToBounds = false
        backgroundCardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        backgroundCardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundCardView.layer.shadowOpacity = 0.8
    }
    
}
