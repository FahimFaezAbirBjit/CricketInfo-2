//
//  SearchPlayerVc.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 23/2/23.
//

import UIKit

class SearchPlayerVc: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var searchField: UITextField!
    let searchPlayerVc = SearchPlayerVm()
    let apiMaker = ApiMaker()
    var players = [Player]()
    var copyPlayer = [Player]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        searchField.layer.cornerRadius = 10
        setSearchBarImage()
        bodyView.layer.cornerRadius = 15
        bodyView.layer.masksToBounds = true
        tableView.delegate = self
        tableView.dataSource = self
        setUpBindersForPlayerInfo()
        setUpBinderForIndexPath()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.isNavigationBarHidden = true
        searchPlayerVc.getSearchPlayer()
        setUpBindersForPlayerInfo()
        setUpBinderForIndexPath()
    }
    func setSearchBarImage(){
        let searchIcon  = UIImageView()
        searchIcon.image = UIImage(systemName: "magnifyingglass")
        let uiView = UIView()
        uiView.addSubview(searchIcon)
        uiView.frame = CGRect(x: 10, y: 0, width: UIImage(systemName: "magnifyingglass")!.size.width+15, height: UIImage(systemName: "magnifyingglass")!.size.height)
        searchIcon.frame = CGRect(x:10, y: 0, width: UIImage(systemName: "magnifyingglass")!.size.width, height: UIImage(systemName: "magnifyingglass")!.size.height)
        searchField.layer.borderWidth = 1
        searchField.layer.masksToBounds = true
        searchField.leftView = uiView
        searchField.leftViewMode = .always
        searchField.clearButtonMode = .whileEditing
        searchIcon.tintColor = UIColor.darkGray
        searchField.addTarget(self, action: #selector(searchPlayer),for: .allEditingEvents)
        //searchField.
    }
    @objc func searchPlayer(){
        players = copyPlayer
        if let searchField = searchField.text{
            if searchField != ""{
                let result = players.filter({$0.playerName?.lowercased().prefix(searchField.count) ?? "" == searchField.lowercased()})
                players = result
                tableView.reloadData()
            }else{
                players = copyPlayer
                tableView.reloadData()
            }
        }
    }
    func setUpBindersForPlayerInfo(){
        searchPlayerVc.playersInfo.bind(listener: { [weak self] playerInfo in
            guard let self = self, let playerInfo = playerInfo else {return}
            self.players = playerInfo
            self.copyPlayer = playerInfo
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    func setUpBinderForIndexPath(){
        searchPlayerVc.indexPath.bind(listener: {[weak self] indexPath in
            guard let self = self, let indexPath = indexPath else {return}
            let storyboard = UIStoryboard(name: "More", bundle: nil)
            if let playerInfoVc = storyboard.instantiateViewController(withIdentifier: Constants.playerInfo) as? PlayerInfoVc
            {
                playerInfoVc.title = self.searchPlayerVc.playersInfo.value?[indexPath.row].playerName
                playerInfoVc.loadViewIfNeeded()
                self.navigationController?.pushViewController(playerInfoVc, animated: true)
            }
        })
    }

}
extension SearchPlayerVc: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(searchField.text!)
    }
}
extension SearchPlayerVc: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.searchPlayerTC, for: indexPath) as! SearchTableCell
        cell.playerName.text = players[indexPath.row].playerName
        cell.playerCountry.text = players[indexPath.row].country
        cell.playerImage.sd_setImage(with: URL(string: players[indexPath.row].playerImage ?? ""))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

extension SearchPlayerVc: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        searchPlayerVc.indexPath.value = indexPath
    }
}
