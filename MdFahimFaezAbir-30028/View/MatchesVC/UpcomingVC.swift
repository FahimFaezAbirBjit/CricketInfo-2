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
    let apiMaker = ApiMaker()
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingMatchTableView.delegate = self
        upcomingMatchTableView.dataSource = self
        setUpBindersForUpcomingMatches()
        setUpBindersForIndexPath()
        let url = apiMaker.buildFixturesURL(startingFrom: TimeConvertion.shared.currentDate(), endingOn: TimeConvertion.shared.nextMonth(next: 6), isReverse: false)
       upcomingVm.getUpcomingMatches(url: url)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
        let url = apiMaker.buildFixturesURL(startingFrom: TimeConvertion.shared.currentDate(), endingOn: TimeConvertion.shared.nextMonth(next: 6), isReverse: false)
       upcomingVm.getUpcomingMatches(url: url)
      
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
        //tabBarController?.tabBar.isHidden = true
    }
    func setUpBindersForIndexPath(){
        upcomingVm.indexPathUpcoming.bind { [weak self] row in
            guard let row = row,let self = self else {return}
            let storyboard = UIStoryboard(name: "DetailInfo", bundle: nil)
            if let detailVc = storyboard.instantiateViewController(withIdentifier: Constants.detailInfoVc) as? DetailVc
            {
                if let matches = self.upcomingVm.upcomingMatches.value {
                    detailVc.loadViewIfNeeded()
                    detailVc.detailVc.setFixId(fixId: matches[row].fixId)
                    InfoVcModel.infoId.value = matches[row].fixId
                    ScoreCardVcModel.scorecardId.value = matches[row].fixId
                    SquadVcModel.squadId.value = matches[row].fixId
                    LiveDetailViewModel.fixId.value = matches[row].fixId
                    detailVc.title = matches[row].localTeamCode + " V " + matches[row].visitorTeamCode + ", " +  matches[row].round
                    self.navigationController?.pushViewController(detailVc, animated: true)
                }

            }
        }
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
        upcomingVm.setIndexPath(row: indexPath.row)
    }
}
