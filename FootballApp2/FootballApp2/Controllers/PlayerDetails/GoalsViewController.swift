//
//  GoalsViewController.swift
//  FootballApp2
//
//  Created by gal linial on 12/12/2021.
//

import UIKit

class GoalsViewController: UIViewController {
    var player:PlayerResponse?
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var TeamImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var goalsTotal: UILabel!
    @IBOutlet weak var assists: UILabel!
    @IBOutlet weak var passingTotal: UILabel!
    @IBOutlet weak var passingKey: UILabel!
    @IBOutlet weak var passingAccurate: UILabel!
    @IBOutlet weak var penalityScored: UILabel!
    @IBOutlet weak var penaltyMissed: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var appearences: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage()
        getPlayerInfo()
    }
    func getPlayerInfo(){
        player?.statistics[0].team.logo.downloadImage(to: TeamImage)
        teamName.text = player?.statistics[0].team.name
        playerName.text = player?.player.name
        goalsTotal.text = (player?.statistics[0].goals.total?.formatted() ?? "") + " - Goals"
        assists.text = (player?.statistics[0].goals.assists?.formatted() ?? "") + " - Assists"
        passingTotal.text = (player?.statistics[0].passes.total?.formatted() ?? "") + " - Total Passing"
        appearences.text = (player?.statistics[0].games.appearences?.formatted() ?? "") + " - Games"
        passingKey.text = (player?.statistics[0].passes.key?.formatted() ?? "") + " - Key Passes"
        passingAccurate.text = (player?.statistics[0].passes.key?.formatted() ?? "") + " - Accurate Passes"
        penalityScored.text = (player?.statistics[0].penalty.scored?.formatted() ?? "0") + " - Scored"
        penaltyMissed.text = (player?.statistics[0].penalty.missed?.formatted() ?? "0") + " - Missed"
        player?.player.photo.downloadImage(to: playerImage)
        
    }
    func backgroundImage(){
        UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "mbappe.jpeg")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
}
