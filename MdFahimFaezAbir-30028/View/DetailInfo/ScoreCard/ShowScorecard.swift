//
//  ShowScorecard.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 20/2/23.
//

import UIKit

struct Expand{
    var isExpand: Bool
}


class ShowScorecard: UIViewController {
    var isExpand = true
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: Constants.scoreCardHeader, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: Constants.scoreCardHeader)
    }
    
}

extension ShowScorecard: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isExpand{
            return 0
        }
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.firstInnings, for: indexPath)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.secInnings, for: indexPath)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nibView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.scoreCardHeader) as? ScorecardHeader
        guard let nibView = nibView else {return UIView()}
        if section ==  0{
            nibView.score.text = "120-1(20)"
            nibView.expandButton.addTarget(self, action: #selector(expandRow), for: .touchUpInside)
            nibView.expandButton.tag = section
        }
        else{
            nibView.score.text = "121-2(19.5)"
            nibView.expandButton.addTarget(self, action: #selector(expandRow), for: .touchUpInside)
            nibView.expandButton.tag = section
            return nibView
        }
        return nibView
    }
   @objc
    func expandRow(button: UIButton){
        print(button.tag)
       // isExpand = !isExpand
        let expand =  isExpand
        isExpand = !isExpand
        print(isExpand)
        var indexPath = [IndexPath]()
        for i in 0..<5{
            var index = IndexPath(row: i, section: button.tag)
            indexPath.append(index)
            print(indexPath)
        }
        if expand{
            button.setImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
            tableView.deleteRows(at: indexPath, with: .fade)
           // tableView.reloadSections([button.tag], with: .fade)
        }
        else{
            button.setImage(UIImage(systemName: "chevron.up.circle"), for: .normal)
            tableView.insertRows(at: indexPath, with: .fade)
            tableView.reloadSections([button.tag], with: .fade)
        }
       
    }
    
    
}
extension ShowScorecard: UITableViewDelegate{
    
}
