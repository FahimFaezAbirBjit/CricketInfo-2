//
//  ShowSquadVc.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 21/2/23.
//

import UIKit

class ShowSquadVc: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var visitorTeamFlag: UIImageView!
    
    @IBOutlet weak var localTeamFlag: UIImageView!
    
    @IBOutlet weak var localTeamName: UILabel!
    @IBOutlet weak var visitorTeamName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        visitorTeamFlag.layer.cornerRadius = visitorTeamFlag.frame.size.height/2
        localTeamFlag.layer.cornerRadius = localTeamFlag.frame.size.height/2
        setUpBindersForSquad()
    }
    func setUpBindersForSquad(){
        ShowsquadVcModel.squad.bind(listener: {[weak self] squad in
            guard let self = self, let squad = squad else {return}
            DispatchQueue.main.async {
                if !squad[0].squad.isEmpty && !squad[1].squad.isEmpty{
                    self.localTeamFlag.sd_setImage(with: URL(string: squad[0].squad[0].playerTeamFlag))
                    self.visitorTeamFlag.sd_setImage(with: URL(string: squad[1].squad[0].playerTeamFlag))
                    self.localTeamName.text = squad[0].squad[0].teamName
                    self.visitorTeamName.text = squad[1].squad[0].teamName
                    self.tableView.reloadData()
                }
            }
        })
    }
}
extension ShowSquadVc: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let localCount = ShowsquadVcModel.squad.value?[0].squad.count ?? 0
        let visitorCount = ShowsquadVcModel.squad.value?[1].squad.count ?? 0
        if localCount < visitorCount{
            return localCount
        }
        else{
            return visitorCount
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.squadTableCell, for: indexPath) as! SquadTableCell
        guard let squads = ShowsquadVcModel.squad.value else {return UITableViewCell()}
        if !squads[0].squad.isEmpty && !squads[1].squad.isEmpty{
            cell.localTeamPlayerName.text = squads[0].squad[indexPath.row].playerName
            cell.visitorTeamName.text = squads[1].squad[indexPath.row].playerName
            cell.localTeamPlayerPosition.text = squads[0].squad[indexPath.row].playerPosition
            cell.visitorTeamPlayerPosition.text = squads[1].squad[indexPath.row].playerPosition
            cell.localTeamPlayerImage.sd_setImage(with: URL(string: squads[0].squad[indexPath.row].playerImage))
            cell.visitorTeamPlayer.sd_setImage(with: URL(string: squads[1].squad[indexPath.row].playerImage))
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

extension ShowSquadVc: UITableViewDelegate{
    
}
