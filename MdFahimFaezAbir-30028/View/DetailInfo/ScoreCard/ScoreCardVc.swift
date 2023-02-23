//
//  ScoreCardVc.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 17/2/23.
//

import UIKit

class ScoreCardVc: UIViewController {
    var scorecardVc = ScoreCardVcModel()
    
    @IBOutlet weak var errorMessageView: UIView!
    @IBOutlet weak var scorecardView: UIView!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var result: UILabel!
    let apiMaker = ApiMaker()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBindersForFixId()
        setUpBindersForScorecard()
        setUpBindersForIsUpcoming()
        errorMessageView.isHidden = true
        scorecardView.isHidden = false
    }
    func setUpBindersForFixId(){
        ScoreCardVcModel.scorecardId.bind(listener: { [weak self] fixId in
            guard let self = self,let fixId = fixId else {return}
            let url = self.apiMaker.buildScorcardUrl(id: fixId)
            print(url)
            self.scorecardVc.getscore(url: url)
            print("Hello")
            
        })
    }
    func setUpBindersForScorecard(){
        scorecardVc.teamInfo.bind(listener: { [weak self] teamInfo in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.result.text = teamInfo?.note
            }
        })
    }
    func setUpBindersForIsUpcoming(){
        scorecardVc.isUpcomingMatch.bind(listener: { [weak self] flag in
            guard let self = self, let flag = flag else {return}
            DispatchQueue.main.async {
                if flag{
                    self.scorecardView.isHidden = true
                    self.errorMessageView.isHidden = false
                }else{
                    self.scorecardView.isHidden = false
                    self.errorMessageView.isHidden = true
                }
            }
        })
    }
    
}
