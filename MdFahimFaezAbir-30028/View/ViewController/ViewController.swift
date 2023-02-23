//
//  ViewController.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 9/2/23.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Outlet
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var networkErrorView: UIView!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Variable
    let normalTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.foregroundColor: UIColor.white
    ]
    let selectedTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.foregroundColor: UIColor.black
    ]
    var swipeGestureHelper: SwipeGestureHelper?
    var gestureRecognizers: UIGestureRecognizer!
    var tabBar = TransparentTabBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiCustomization()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    
}

