//
//  NetworkErrorVC.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 10/2/23.
//

import UIKit

class NetworkErrorVC: UIViewController {

    @IBOutlet weak var tryAgain: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tryAgain.layer.cornerRadius = 10
    }
}
