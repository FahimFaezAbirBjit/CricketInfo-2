//
//  RecentVC.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 15/2/23.
//

import UIKit

class RecentVC: UIViewController {
    @IBOutlet weak var recentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        recentTableView.delegate = self
        recentTableView.dataSource = self
    }
}

extension RecentVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       5
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Recent"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recentVewCell, for: indexPath)
        return cell
    }
    
    
}
extension RecentVC: UITableViewDelegate{
    
}
