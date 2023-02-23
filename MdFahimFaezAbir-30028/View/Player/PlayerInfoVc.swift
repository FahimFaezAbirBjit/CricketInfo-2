//
//  PlayerInfoVc.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 23/2/23.
//

import UIKit

class PlayerInfoVc: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        navigationController?.isNavigationBarHidden = false
        tableView.delegate = self
        tableView.dataSource = self
       
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        navigationController?.isNavigationBarHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = true
    }
}
extension PlayerInfoVc: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else if section == 1{
            return 4
        }
        return 2
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return nil
        }else if section == 1{
            return "Personal Info"
        }else if section == 2{
            return "Batting"
        }else{
            return "Bowling"
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 250
        }else{
           return 50
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.playerInfoCell , for: indexPath)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.playerPersonalInfoCell , for: indexPath) as! PersonalInfoCell
            if indexPath.row == 0{
                cell.category.text = "Born"
            }else if indexPath.row == 1{
                cell.category.text = "Fullname"
            }else if indexPath.row == 2{
                cell.category.text = "Batting Style"
            }else if indexPath.row == 3{
                cell.category.text = "Bowling Style"
            }
            return cell
        }else if indexPath.section == 2{
            return UITableViewCell()
        }else{
            return UITableViewCell()
        }
    }
    
    
}
extension PlayerInfoVc: UITableViewDelegate{
    
}
