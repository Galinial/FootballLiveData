//
//  MenuViewController.swift
//  FootballApp2
//
//  Created by gal linial on 13/12/2021.
//

import UIKit
import CloudKit

class MenuViewController: UIViewController {
    var leagueId:Int?
    @IBOutlet weak var tableButton: UIButton!
    @IBOutlet weak var topScorrerButton: UIButton!
    @IBOutlet weak var leagueImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingleagueImage(leagueId: leagueId!)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
          backgroundImage()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTopScorrer" {
            if let dest = segue.destination as? PlayersTableViewController{
                dest.leagueId = self.leagueId
            }
        } else if segue.identifier == "showTableStandings" {
            if let dest = segue.destination as? TableTableViewController{
                dest.leagueId = self.leagueId
            }
        }
    }
    func settingleagueImage (leagueId:Int){
        if leagueId == 39 {
            self.leagueImage.image = UIImage(named: "premierLeague")
        }else if leagueId == 140 {
            self.leagueImage.image = UIImage(named: "laligalogo")
        }
    }
    
    func backgroundImage(){
        
     
        UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "football-wallpaper-whatspaper-18.jpeg")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        self.view.backgroundColor = UIColor(patternImage: image)
        UIGraphicsEndImageContext()
    }
}
