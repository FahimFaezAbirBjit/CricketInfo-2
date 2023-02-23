//
//  HomeVC.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 11/2/23.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var vcModel = HomeVcModel()
    let apiMaker = ApiMaker()
    //var modelList: [HomeModelData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate  = self
        setUpBindersForMatchData()
        let url = apiMaker.buildFixturesURL(startingFrom: TimeConvertion.shared.previousDate(prev: -5), endingOn: TimeConvertion.shared.nextDate(next: 5), isReverse: false)
        vcModel.getRecentMatches(url: url)
        setUpBindersForIndexPath()
    }
    override func viewWillAppear(_ animated: Bool) {
        let url = apiMaker.buildFixturesURL(startingFrom: TimeConvertion.shared.previousDate(prev: -5), endingOn: TimeConvertion.shared.nextDate(next: 5), isReverse: false)
       print(url)
       vcModel.getRecentMatches(url: url)
       setUpBindersForIndexPath()
       tableView.reloadData()
    }
    override func viewWillDisappear(_: Bool) {
        navigationController?.isNavigationBarHidden = false
      //  tabBarController?.tabBar.isHidden = true
    }
    func setUpBindersForIndexPath(){
        HomeVcModel.indexPath.bind(listener: { [weak self] row in
            guard let row = row,let self = self else {return}
            let storyboard = UIStoryboard(name: "DetailInfo", bundle: nil)
            if let detailVc = storyboard.instantiateViewController(withIdentifier: Constants.detailInfoVc) as? DetailVc
            {
                if let matches = self.vcModel.matches.value {
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
        })
    }
}
