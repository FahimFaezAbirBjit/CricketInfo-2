//
//  InfoVc.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 17/2/23.
//

import UIKit

class InfoVc: UIViewController {
//MARK: - Outlets
    @IBOutlet weak var referee: UILabel!
    @IBOutlet weak var venueVc: UIView!
    @IBOutlet weak var infoVc: UIView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var capacity: UILabel!
    @IBOutlet weak var match: UILabel!
    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var umpires: UILabel!
    @IBOutlet weak var thirdUmpire: UILabel!
    @IBOutlet weak var toss: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var league: UILabel!
    @IBOutlet weak var series: UILabel!
    var innfoVc = InfoVcModel()
    var apiMaker = ApiMaker()
    override func viewDidLoad() {
        super.viewDidLoad()
        venueVc.layer.cornerRadius = 15
        infoVc.layer.cornerRadius = 15
        venueVc.layer.masksToBounds = true
        infoVc.layer.masksToBounds = true
        setUpBindersForFixId()
        setUpBindersForInfo()
        //setInfo()
    }
    func setUpBindersForFixId(){
        InfoVcModel.infoId.bind(listener: { [weak self]id in
          guard let self = self, let fix_id = id else {return}

            let url = self.apiMaker.buildInfoUrl(id: fix_id)
            self.innfoVc.getInfo(url: url)
        })
    }
    func setUpBindersForInfo(){
        innfoVc.info.bind(listener: { [weak self] info in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.match.text = info?.match
                self.series.text = info?.series
                self.league.text = info?.leauge
                self.date.text = info?.date
                self.time.text = info?.time
                self.toss.text = info?.toss
                self.umpires.text = info?.umpires
                self.thirdUmpire.text = info?.thirdUmpire
                self.referee.text = info?.refree
                self.venue.text = info?.venue
                self.city.text = info?.city
                self.capacity.text = info?.capacity
            }
            
        })
    }
}
