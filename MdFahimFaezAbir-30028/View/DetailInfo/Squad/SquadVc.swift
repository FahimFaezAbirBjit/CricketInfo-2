//
//  SquadVc.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 21/2/23.
//

import UIKit

class SquadVc: UIViewController {

    @IBOutlet weak var squadView: UIView!
    @IBOutlet weak var squadErrorview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        squadErrorview.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
