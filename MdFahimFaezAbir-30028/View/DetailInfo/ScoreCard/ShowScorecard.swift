//
//  ShowScorecard.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 20/2/23.
//

import UIKit


class ShowScorecard: UIViewController {
    var isExpand = true
    var teamInfo = [TeamInfo]()
    var inningsInfo = [ExpandableInnings]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: Constants.scoreCardHeader, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: Constants.scoreCardHeader)
        setUpBinderForTeamInfo()
        setUpBinderForInnings()
        setUpBinderForBowlingInnigs()
    }
    func setUpBinderForTeamInfo(){
        ShowScorecardVcModel.teamInfo.bind(listener: { [weak self] _ in
            guard let self =  self else {return}
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    func setUpBinderForInnings(){
        ShowScorecardVcModel.inningsInfo.bind(listener: { [weak self] _ in
            guard let self =  self else {return}
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    func setUpBinderForBowlingInnigs(){
        ShowScorecardVcModel.bowlerInfo.bind(listener: { [weak self] bowling in
            guard let self =  self else {return}
            dump(bowling)
            DispatchQueue.main.async {
                // self.tableView.reloadData()
            }
        })
    }
}

extension ShowScorecard: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        ShowScorecardVcModel.inningsInfo.value?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !(ShowScorecardVcModel.inningsInfo.value?[section].isExpand ?? true){
            return (ShowScorecardVcModel.inningsInfo.value?[section].batsman.count ?? 0) + (ShowScorecardVcModel.bowlerInfo.value?[section].bowler.count ?? 0) + 1
            // print()
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.firstInnings, for: indexPath) as! ScorecardFirstInningsCell
        cell.scoreView.backgroundColor = .white
        cell.runStack.distribution = .fillEqually
        if indexPath.row == 0{
            cell.scoreView.backgroundColor = .systemGray6
        }
        let battingIndexCount = ShowScorecardVcModel.inningsInfo.value?[indexPath.section].batsman.count ?? 0
        let bowlingIndexCount = ShowScorecardVcModel.bowlerInfo.value?[indexPath.section].bowler.count ?? 0
        if indexPath.row < battingIndexCount{
            cell.name.text = ShowScorecardVcModel.inningsInfo.value?[indexPath.section].batsman[indexPath.row].batsmanName
            cell.run.text = ShowScorecardVcModel.inningsInfo.value?[indexPath.section].batsman[indexPath.row].run
            cell.ball.text = ShowScorecardVcModel.inningsInfo.value?[indexPath.section].batsman[indexPath.row].ball
            cell.four.text = ShowScorecardVcModel.inningsInfo.value?[indexPath.section].batsman[indexPath.row].four
            cell.six.text = ShowScorecardVcModel.inningsInfo.value?[indexPath.section].batsman[indexPath.row].six
            cell.sr.text = ShowScorecardVcModel.inningsInfo.value?[indexPath.section].batsman[indexPath.row].strikeRate
            cell.outStatus.text = ShowScorecardVcModel.inningsInfo.value?[indexPath.section].batsman[indexPath.row].outStatus
        }else if indexPath.row == battingIndexCount{
            if indexPath.section == 0 {
                cell.runStack.distribution = .fillProportionally
                cell.name.text = "Extras"
                cell.outStatus.text = ""
                cell.run.text = ShowScorecardVcModel.teamInfo.value?.extrasfirst
                cell.ball.text = ""
                cell.four.text = ""
                cell.six.text = ""
                cell.sr.text = ""
            }else{
                cell.runStack.distribution = .fillProportionally
                cell.name.text = "Extras"
                cell.run.text = ShowScorecardVcModel.teamInfo.value?.extrasSec
                cell.ball.text = ""
                cell.four.text = ""
                cell.six.text = ""
                cell.sr.text = ""
                cell.outStatus.text = ""
            }
        }else if indexPath.row > battingIndexCount{
            let idx = (indexPath.row % (battingIndexCount+1))
            if idx == 0{
                cell.scoreView.backgroundColor = .systemGray6
            }
            cell.name.text = ShowScorecardVcModel.bowlerInfo.value?[indexPath.section].bowler[idx].bowlerName
            cell.outStatus.text = ""
            cell.run.text = ShowScorecardVcModel.bowlerInfo.value?[indexPath.section].bowler[idx].over
            cell.ball.text = ShowScorecardVcModel.bowlerInfo.value?[indexPath.section].bowler[idx].maidenOver
            cell.four.text = ShowScorecardVcModel.bowlerInfo.value?[indexPath.section].bowler[idx].bowlerRun
            cell.six.text = ShowScorecardVcModel.bowlerInfo.value?[indexPath.section].bowler[idx].bowlerWicket
            cell.sr.text = ShowScorecardVcModel.bowlerInfo.value?[indexPath.section].bowler[idx].bowlerEconomy
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nibView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.scoreCardHeader) as? ScorecardHeader
        guard let nibView = nibView else {return UIView()}
        if section ==  0{
            nibView.expandButton.setImage(UIImage(systemName: "chevron.down.circle"),for: .normal)
            nibView.inings.text = ShowScorecardVcModel.teamInfo.value?.firstInningsTeam
            nibView.score.text = ShowScorecardVcModel.teamInfo.value?.firstInningsScore
            nibView.expandButton.addTarget(self, action: #selector(expandRow), for: .touchUpInside)
            nibView.expandButton.tag = section
        }
        else{
            nibView.expandButton.setImage(UIImage(systemName: "chevron.down.circle"),for: .normal)
            nibView.score.text = ShowScorecardVcModel.teamInfo.value?.secInningsScore
            nibView.inings.text = ShowScorecardVcModel.teamInfo.value?.secInningsTeam
            nibView.expandButton.addTarget(self, action: #selector(expandRow), for: .touchUpInside)
            nibView.expandButton.tag = section
            return nibView
        }
        return nibView
    }
    @objc
    func expandRow(button: UIButton){
        let section = button.tag
        var indexPaths = [IndexPath]()
        guard let inings = ShowScorecardVcModel.inningsInfo.value?[section].batsman.count else {return}
        guard let bowlinginings = ShowScorecardVcModel.bowlerInfo.value?[section].bowler.count else {return}
        // print(inings)
        // print(bowlinginings)
        for row in 0..<inings + bowlinginings + 1{
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        let isExpand = ShowScorecardVcModel.inningsInfo.value?[section].isExpand
        ShowScorecardVcModel.inningsInfo.value?[section].isExpand = !(isExpand ?? true)
        button.setImage(UIImage(systemName: "chevron.up.circle"),for: .normal)
        // button.setImage(isExpand ?? true ? UIImage(systemName: "chevron.up.down") : UIImage(systemName: "chevron.up.circle"),for: .normal)
        if isExpand ?? true{
            button.setImage(UIImage(systemName: "chevron.up.circle"),for: .normal)
            tableView.insertRows(at: indexPaths, with: .fade)
        } else{
            button.setImage(UIImage(systemName: "chevron.down.circle"),for: .normal)
            tableView.deleteRows(at: indexPaths, with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let translation = CATransform3DTranslate(CATransform3DIdentity, -300, 0, 0)
        cell.layer.transform = translation
        UIView.animate(withDuration: 0.5) {
            cell.layer.transform = CATransform3DIdentity
        }
    }
}
extension ShowScorecard: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
