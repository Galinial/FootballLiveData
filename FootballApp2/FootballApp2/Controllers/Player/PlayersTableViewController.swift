//
//  PlayersTableViewController.swift
//  FootballApp2
//
//  Created by gal linial on 07/12/2021.
//

import UIKit
import Combine
class PlayersTableViewController: UITableViewController{
    
    var filteredPlayers = [PlayerResponse]()
    var resultSearchController = UISearchController()

    var leagueId:Int?
    var players:[PlayerResponse] = []
    var tasks = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        searchBar
        resultSearchController = ({
                let controller = UISearchController(searchResultsController: nil)
                controller.searchResultsUpdater = self
                controller.searchBar.sizeToFit()

                tableView.tableHeaderView = controller.searchBar

                return controller
            })()
        
        
        // register the xib to the tabelview
        tableView.register(UINib(nibName: "PlayerTableViewCell", bundle: .main), forCellReuseIdentifier: "cell")
        
        self.tableView.separatorStyle = .none
        
        ApiManager.requestTopScorrer(leagueId: self.leagueId ?? 39)
            .receive(on: DispatchQueue.main )
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished Successfuly")
                    break
                case .failure:
                    print("Failed")
                    break
                }
            } receiveValue: { [weak self] result in
                let details = result.response
                self?.players = details
                self?.tableView.reloadData()
            }.store(in: &tasks)
        filteredPlayers = players
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if  (resultSearchController.isActive) {
              return filteredPlayers.count
          } else {
              return players.count
          }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerTableViewCell
        
        
        
        if (resultSearchController.isActive) {
            let filteredPlayer = filteredPlayers[indexPath.row]
                cell.populate(player: filteredPlayer)
        }
          
        else {
            let player = players[indexPath.row]
            cell.populate(player: player)
          }
        return cell
    }
        
        
//      old way
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerTableViewCell
//        let player = players[indexPath.row]
//        cell.populate(player: player)
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showGoals", sender: filteredPlayers[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGoals", let player  = sender as? PlayerResponse {
            
            if let dest = segue.destination as? GoalsViewController{
                
                dest.modalTransitionStyle  = .flipHorizontal
                dest.player = player
            }
                
        }
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 157
    }

}

extension PlayersTableViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else{return}
        filteredPlayers.removeAll(keepingCapacity: false)
        
        for player in players{
            if player.details.name.uppercased().contains(text.uppercased()){
                filteredPlayers.append(player)
            }
        }
            self.tableView.reloadData()
    }
}

