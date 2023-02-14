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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate  = self
        let url = "https://cricket.sportmonks.com/api/v2.0/fixtures/?include=localteam.country,visitorteam.country,runs,venue,stage&fields[fixtures]=id,starting_at,loacalteam,visitorteam,runs,status,live,round,note&sort=starting_at&filter[starts_between]=2023-1-15,2023-2-14&api_token=tdfy0GkKqZjQ1x7cZ79dQIT6VLeygjPJaMUIErC8URWie3nG7xatObPGuRnV"
        vcModel.getRecentMatches(url: url)
        setUpBindersForMatchData()
        //dump(vcModel.matches.value)
    }
}
