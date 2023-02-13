//
//  HomeVC.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 11/2/23.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate  = self
        ApiResponse.shared.getApiData<Welcome>(url: "https://cricket.sportmonks.com/api/v2.0/fixtures/?include=localteam.country,visitorteam.country,runs,venue,stage&filter[starts_between]=2023-01-01,2023-02-13&fields[fixtures]=id,starting_at,loacalteam,visitorteam,runs&sort=-starting_at", completion: { results in
            
        })
    }
}
