//
//  TableTableViewController.swift
//  FootballApp2
//
//  Created by gal linial on 13/12/2021.
//

import UIKit

class TableTableViewController: UITableViewController {
    var leagueId:Int?
    var teams:[standingsDetails] = []
    
    var filteredTeams = [standingsDetails]()
    var resultSearchController = UISearchController()
    
    
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
        
        
        
        tableView.register(UINib(nibName: "StandingsTableViewCell", bundle: .main), forCellReuseIdentifier: "cell")
        
        self.tableView.separatorStyle = .none
        
        
        ApiManager.requestStandings(leagueId:self.leagueId ?? 39) { [weak self] result in
            let details = result.response[0].league.standings[0]
                
            self?.teams = details
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        filteredTeams = teams

    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  (resultSearchController.isActive) {
              return filteredTeams.count
          } else {
              return teams.count
          }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StandingsTableViewCell
        
        if (resultSearchController.isActive) {
            let filteredTeam = filteredTeams[indexPath.row]
            cell.populate(details: filteredTeam)
        }
          
        else {
            let team = teams[indexPath.row]
            cell.populate(details: team)
          }
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }

}

extension TableTableViewController:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else{return}
        filteredTeams.removeAll(keepingCapacity: false)
        
        for team in teams{
            if team.team.name.uppercased().contains(text.uppercased()){
                filteredTeams.append(team)
            }
        }
            self.tableView.reloadData()
    }
}

