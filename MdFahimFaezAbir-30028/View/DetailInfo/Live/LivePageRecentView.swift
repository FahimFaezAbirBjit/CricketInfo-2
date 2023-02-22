//
//  LivePageRecentView.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 22/2/23.
//

import UIKit

class LivePageRecentView: UIViewController {

    @IBOutlet weak var manOftheSeriesview: UIView!
    @IBOutlet weak var matchStatusView: UIView!
    
    @IBOutlet weak var localTeamName: UILabel!
    
    @IBOutlet weak var visitorTeamName: UILabel!
    
    @IBOutlet weak var localTeamScore: UILabel!
    
    @IBOutlet weak var playerOftheMatch: UIImageView!
    @IBOutlet weak var visitorteamScore: UILabel!
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var note: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        matchStatusView.layer.cornerRadius = 15
        matchStatusView.layer.cornerRadius = 15
        matchStatusView.layer.masksToBounds = true
        manOftheSeriesview.layer.cornerRadius = 15
        manOftheSeriesview.layer.cornerRadius = 15
        manOftheSeriesview.layer.masksToBounds = true
        setUpBindersForRecentData()
    }
    func setUpBindersForRecentData(){
        LivePageRecentVm.RecentData.bind(listener: { [weak self] data in
            guard let self = self, let data = data else {return}
            DispatchQueue.main.async {
                self.localTeamName.text = data.localTeamName
                self.visitorTeamName.text = data.visitorTeamName
                self.localTeamScore.text = data.localTeamScore
                self.visitorteamScore.text = data.visitorTeamScore
                self.playerName.text = data.playerOftheMatch
                self.note.text = data.note
                self.playerOftheMatch.sd_setImage(with: URL(string: data.playerOftheMatchImage))
            }
        })
    }
}
