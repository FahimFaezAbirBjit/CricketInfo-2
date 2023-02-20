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
            print(fixId)
            let url =  "https://cricket.sportmonks.com/api/v2.0/fixtures/\(fixId)?include=localteam.country,visitorteam.country,stage,tosswon,league,runs,scoreboards,batting.batsman,bowling.bowler,batting.team,bowling.team,batting.catchstump,batting.runoutby,batting.batsmanout,batting.bowler,batting.result&api_token=tdfy0GkKqZjQ1x7cZ79dQIT6VLeygjPJaMUIErC8URWie3nG7xatObPGuRnV"
            print(url)
            self.scorecardVc.getscore(url: url)
            print("Hello")
            
        })
    }
    func setUpBindersForScorecard(){
//        scorecardVc.scorecard.bind(listener: { [weak self] scorecard in
//            guard let self = self else {return}
//            DispatchQueue.main.async {
//                self.result.text = scorecard?.note
//            }
//        })
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
