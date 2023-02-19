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
        setUpBindersForIndexPath()
        let currentDate = Date()
        let calendar = Calendar.current

        let previousDay = calendar.date(byAdding: .day, value: -1, to: currentDate)
        let nextMonth = calendar.date(byAdding: .month, value: 7, to: currentDate)
        // format the date as desired
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let previousDayFormatted = dateFormatter.string(from: currentDate)
        let nextMonthFormatted = dateFormatter.string(from: nextMonth!)
        let url = "https://cricket.sportmonks.com/api/v2.0/fixtures/?include=localteam.country,visitorteam.country,runs,venue,stage&fields[fixtures]=id,starting_at,loacalteam,visitorteam,runs,status,live,round,note&sort=starting_at&filter[starts_between]=\(previousDayFormatted),\(nextMonthFormatted)&api_token=tdfy0GkKqZjQ1x7cZ79dQIT6VLeygjPJaMUIErC8URWie3nG7xatObPGuRnV"
       upcomingVm.getUpcomingMatches(url: url)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
      
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
