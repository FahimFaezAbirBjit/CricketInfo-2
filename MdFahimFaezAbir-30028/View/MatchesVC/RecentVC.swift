//
//  RecentVC.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 15/2/23.
//

import UIKit

class RecentVC: UIViewController {
    @IBOutlet weak var recentTableView: UITableView!
    var recentVm = RecentVcModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        recentTableView.delegate = self
        recentTableView.dataSource = self
        setUpBindersForRecentMatches()
        setUpBindersForIndexPath()
        let url = "https://cricket.sportmonks.com/api/v2.0/fixtures/?include=localteam.country,visitorteam.country,runs,venue,stage&fields[fixtures]=id,starting_at,loacalteam,visitorteam,runs,status,live,round,note&sort=-starting_at&filter[starts_between]=2023-01-15T00:00:00.000000Z,2023-02-15T23:59:00.000000Z&api_token=tdfy0GkKqZjQ1x7cZ79dQIT6VLeygjPJaMUIErC8URWie3nG7xatObPGuRnV"
        recentVm.getRecentMatchesMatches(url: url)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
       // tabBarController?.tabBar.isHidden = true
        navigationController?.isNavigationBarHidden = false
    }
    func setUpBindersForIndexPath(){
        recentVm.recentIndexPath.bind(listener: { [weak self] row in
            guard let row = row,let self = self else {return}
            let storyboard = UIStoryboard(name: "DetailInfo", bundle: nil)
            if let detailVc = storyboard.instantiateViewController(withIdentifier: Constants.detailInfoVc) as? DetailVc
            {
                if let matches = self.recentVm.recentMatches.value {
                    detailVc.loadViewIfNeeded()
                    detailVc.detailVc.setFixId(fixId: matches[row].fixId)
                    InfoVcModel.infoId.value = matches[row].fixId
                    detailVc.title = matches[row].localTeamCode + " V " + matches[row].visitorTeamCode + ", " +  matches[row].round
                    self.navigationController?.pushViewController(detailVc, animated: true)
                }

            }
        })
    }
    func setUpBindersForRecentMatches(){
        recentVm.recentMatches.bind(listener:{ [weak self] _ in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.recentTableView.reloadData()
            }
        })
    }
}

extension RecentVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recentVm.recentMatches.value?.count ?? 0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Recent"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recentVewCell, for: indexPath) as! RecentViewCell
        cell.titleName.text = (recentVm .recentMatches.value?[indexPath.row].round ?? "")
                  + "-" + (recentVm.recentMatches.value?[indexPath.row].stageName ?? "")
        cell.venue.text = recentVm.recentMatches.value?[indexPath.row].venueName ?? ""
        cell.localTeamName.text = recentVm.recentMatches.value?[indexPath.row].localTeamCode ?? ""
        cell.visitorTeamName.text = recentVm.recentMatches.value?[indexPath.row].visitorTeamCode ?? ""
        cell.localTeamScore.text = recentVm.recentMatches.value?[indexPath.row].localTeamScore ?? ""
        cell.visitorTeamScore.text = recentVm.recentMatches.value?[indexPath.row].visitorTeamScore ?? ""
        cell.localTeamFlag.sd_setImage(with: URL(string: recentVm.recentMatches.value?[indexPath.row].localTeamFlag ?? ""))
        cell.visitorTeamFlag.sd_setImage(with: URL(string: recentVm.recentMatches.value?[indexPath.row].visitorTeamFlag ?? ""))
        cell.matchResult.text = recentVm.recentMatches.value?[indexPath.row].result ?? ""
        cell.layer.cornerRadius = 15
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let translation = CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
        cell.layer.transform = translation
        UIView.animate(withDuration: 0.5) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    
}
extension RecentVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        recentVm.setIndexPath(row: indexPath.row)
    }
}
