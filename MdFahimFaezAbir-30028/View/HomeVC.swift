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
    }
}
