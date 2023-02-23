//
//  SquadVc.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 21/2/23.
//

import UIKit

class SquadVc: UIViewController {
    var squadVc = SquadVcModel()
    let apiMaker = ApiMaker()
    @IBOutlet weak var squadView: UIView!
    @IBOutlet weak var squadErrorview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        squadErrorview.isHidden = true
        squadErrorview.isHidden = false
        setUpBindersForFixId()
        setupBindersIsUpcoming()
    }
    func setUpBindersForFixId(){
        SquadVcModel.squadId.bind(listener: { [weak self] fixId in
            guard let self = self, let fixId = fixId else {return}
            let url = self.apiMaker.buildSquadUrl(id: fixId)
            self.squadVc.getSquad(url: url)
        })
    }
    func setupBindersIsUpcoming(){
        squadVc.isUpcoming.bind(listener: { [weak self] isUpcoming in
            guard let self = self, let isUpcoming = isUpcoming else {return}
            DispatchQueue.main.async {
                if isUpcoming{
                    self.squadErrorview.isHidden = false
                    self.squadView.isHidden = true
                }else{
                    self.squadErrorview.isHidden = true
                    self.squadView.isHidden = false
                }
            }
        })
    }
}
