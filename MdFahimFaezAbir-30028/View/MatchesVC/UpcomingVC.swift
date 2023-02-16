//
//  UpcomingVC.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 15/2/23.
//

import UIKit
import SDWebImage
class UpcomingVC: UIViewController {

    @IBOutlet weak var upcomingMatchTableView: UITableView!
    var upcomingVm = UpcomingVcModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingMatchTableView.delegate = self
        upcomingMatchTableView.dataSource = self
        setUpBindersForUpcomingMatches()
        let url = "https://cricket.sportmonks.com/api/v2.0/fixtures/?include=localteam.country,visitorteam.country,runs,venue,stage&fields[fixtures]=id,starting_at,loacalteam,visitorteam,runs,status,live,round,note&sort=starting_at&filter[starts_between]=2023-02-15T00:00:00.000000Z,2023-05-20T23:59:00.000000Z&api_token=tdfy0GkKqZjQ1x7cZ79dQIT6VLeygjPJaMUIErC8URWie3nG7xatObPGuRnV"
       upcomingVm.getUpcomingMatches(url: url)
    }
    override func viewWillAppear(_ animated: Bool) {
//        let url = "https://cricket.sportmonks.com/api/v2.0/fixtures/?include=localteam.country,visitorteam.country,runs,venue,stage&fields[fixtures]=id,starting_at,loacalteam,visitorteam,runs,status,live,round,note&sort=starting_at&filter[starts_between]=2023-02-15T00:00:00.000000Z,2023-05-20T23:59:00.000000Z&api_token=tdfy0GkKqZjQ1x7cZ79dQIT6VLeygjPJaMUIErC8URWie3nG7xatObPGuRnV"
//       upcomingVm.getUpcomingMatches(url: url)
    }
    func setUpBindersForUpcomingMatches(){
        upcomingVm.upcomingMatches.bind(listener:{ [weak self] _ in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.upcomingMatchTableView.reloadData()
            }
        })
    }
}

extension UpcomingVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        upcomingVm.upcomingMatches.value?.count ?? 0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Upcoming"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.upcomingCell, for: indexPath) as! UpcomingViewCell
        cell.leagueLabel.text = (upcomingVm.upcomingMatches.value?[indexPath.row].round ?? "")
                                + "-" + (upcomingVm.upcomingMatches.value?[indexPath.row].stageName ?? "")
        cell.visitorTeamName.text = upcomingVm.upcomingMatches.value?[indexPath.row].visitorTeamName ?? ""
        cell.localTeamName.text = upcomingVm.upcomingMatches.value?[indexPath.row].localTeamName ?? ""
        cell.visitorTeamImage.sd_setImage(with: URL(string: upcomingVm.upcomingMatches.value?[indexPath.row].visitorTeamFlag ?? "" ))
        cell.localTeamImage.sd_setImage(with: URL(string: upcomingVm.upcomingMatches.value?[indexPath.row].localTeamFlag ?? "" ))
        cell.venue.text = upcomingVm.upcomingMatches.value?[indexPath.row].venueName ?? ""
        cell.date.text = upcomingVm.upcomingMatches.value?[indexPath.row].startingAt ?? ""
        cell.layer.cornerRadius = 10
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
extension UpcomingVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
