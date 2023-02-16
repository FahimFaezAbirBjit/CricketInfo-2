//
//  detailVc.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 16/2/23.
//

import UIKit

class DetailVc: UIViewController {
    var detailVc = DetailVcModel()
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpBindersForFixId()
    }
    func setUpBindersForFixId(){
        detailVc.fixtureId.bind(listener: { [weak self] fixId in
            print(fixId)
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.tabBarController?.tabBar.isHidden = false
    }
    
}
