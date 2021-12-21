//
//  LeaguesViewController.swift
//  FootballApp2
//
//  Created by gal linial on 12/12/2021.
//

import UIKit

class LeaguesViewController: UIViewController {
    @IBOutlet weak var premierLeague: UIButton!
    @IBOutlet weak var laLiga: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage()
        premierLeague.toCardBackgroundLeague()
        laLiga.toCardBackgroundLeague()
        
            
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showPremierLeague" {
                if let dest = segue.destination as? MenuViewController{
                    dest.leagueId = 39
                }
                    
            }else if segue.identifier == "showLaLiga" {
                if let dest = segue.destination as? MenuViewController{
                    dest.leagueId = 140
               }
            }
    }
    
    func backgroundImage(){
        UIGraphicsBeginImageContext(self.view.frame.size)
            UIImage(named: "photo-1543351611-58f69d7c1781.jpeg")?.draw(in: self.view.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
    }
}



