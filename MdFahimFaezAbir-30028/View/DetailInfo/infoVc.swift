//
//  InfoVc.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 17/2/23.
//

import UIKit

class InfoVc: UIViewController {

    @IBOutlet weak var venueVc: UIView!
    @IBOutlet weak var infoVc: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        venueVc.layer.cornerRadius = 15
        infoVc.layer.cornerRadius = 15
        venueVc.layer.masksToBounds = true
        infoVc.layer.masksToBounds = true
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
