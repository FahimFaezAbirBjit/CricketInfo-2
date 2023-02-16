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
    
    //var modelList: [HomeModelData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate  = self
        setUpBindersForMatchData()
        let url = "https://cricket.sportmonks.com/api/v2.0/fixtures/?include=localteam.country,visitorteam.country,runs,venue,stage&fields[fixtures]=id,starting_at,loacalteam,visitorteam,runs,status,live,round,note&sort=starting_at&filter[starts_between]=2023-02-02T00:00:00.000000Z,2023-02-20T23:59:00.000000Z&api_token=tdfy0GkKqZjQ1x7cZ79dQIT6VLeygjPJaMUIErC8URWie3nG7xatObPGuRnV"
        vcModel.getRecentMatches(url: url)
        setUpBindersForIndexPath()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
       // tabBarController?.tabBar.isHidden = false
        let url = "https://cricket.sportmonks.com/api/v2.0/fixtures/?include=localteam.country,visitorteam.country,runs,venue,stage&fields[fixtures]=id,starting_at,loacalteam,visitorteam,runs,status,live,round,note&sort=starting_at&filter[starts_between]=2023-02-02T00:00:00.000000Z,2023-02-20T23:59:00.000000Z&api_token=tdfy0GkKqZjQ1x7cZ79dQIT6VLeygjPJaMUIErC8URWie3nG7xatObPGuRnV"
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
                    self.navigationController?.pushViewController(detailVc, animated: true)
                }

            }
        })
    }
}
