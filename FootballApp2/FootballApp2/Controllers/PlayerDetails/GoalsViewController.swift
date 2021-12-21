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
        player?.getStatisticts().team.logo.downloadImage(to: TeamImage)
        teamName.text = player?.getStatisticts().team.name
        playerName.text = player?.details.name
        goalsTotal.text = (player?.getStatisticts().goals.total?.formatted() ?? "") + " - Goals"
        assists.text = (player?.getStatisticts().goals.assists?.formatted() ?? "") + " - Assists"
        passingTotal.text = (player?.getStatisticts().passes.total?.formatted() ?? "") + " - Total Passing"
        appearences.text = (player?.getStatisticts().games.appearences?.formatted() ?? "") + " - Games"
        passingKey.text = (player?.getStatisticts().passes.key?.formatted() ?? "") + " - Key Passes"
        passingAccurate.text = (player?.getStatisticts().passes.key?.formatted() ?? "") + " - Accurate Passes"
        penalityScored.text = (player?.getStatisticts().penalty.scored?.formatted() ?? "0") + " - Scored"
        penaltyMissed.text = (player?.getStatisticts().penalty.missed?.formatted() ?? "0") + " - Missed"
        player?.details.photo.downloadImage(to: playerImage)
        
    }
    func backgroundImage(){
        UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "mbappe.jpeg")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
}
