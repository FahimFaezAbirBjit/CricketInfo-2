//
//  LiveView.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 17/2/23.
//

import UIKit

class LiveDetailView: UIViewController {
    @IBOutlet weak var liveUpComingView: UIView!
    @IBOutlet weak var liveRecentView: UIView!
    var liveDetailVc = LiveDetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBindersForFixId()
        setUpBindersforUpComing()
        liveRecentView.isHidden = true
        liveUpComingView.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        setUpBindersforUpComing()
    }
    func setUpBindersForFixId(){
        LiveDetailViewModel.fixId.bind(listener: { [weak self] fixId in
            guard let self = self,let fixId = fixId else {return}
            print(fixId)
            let url =  "https://cricket.sportmonks.com/api/v2.0/fixtures/\(fixId)?include=localteam.country,visitorteam.country,stage,tosswon,league,runs,scoreboards,batting.batsman,bowling.bowler,batting.team,bowling.team,batting.catchstump,batting.runoutby,batting.batsmanout,batting.bowler,batting.result,manofmatch,manofseries&api_token=aGypft0iQPFUBpefG6U1QInmd9OvUDsadwYyMFJZQSGud9rb80dmNlruCfuL"
            
            print("Hello")
            self.liveDetailVc.getLiveDetails(url: url)
        })
    }
    func setUpBindersforUpComing(){
        liveDetailVc.isUpcoming.bind(listener: { [weak self] flag in
            guard let self = self,let flag = flag else {return}
            DispatchQueue.main.async {
                if flag{
                    self.liveRecentView.isHidden = true
                    self.liveUpComingView.isHidden = false
                }else{
                    self.liveRecentView.isHidden = false
                    self.liveUpComingView.isHidden = true
                }
            }
        })
    }
    
}
