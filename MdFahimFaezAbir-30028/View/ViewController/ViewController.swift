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
    var gestureRecognizers: UIGestureRecognizer!
    var tabBar = TransparentTabBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiCustomization()
    }
    
    //MARK: - Action
    @IBAction func changeViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            changeView(selected: sender.selectedSegmentIndex)
           // segmentController.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        } else {
            changeView(selected: sender.selectedSegmentIndex)
            //segmentController.setTitleTextAttributes(normalTextAttributes, for: .normal)
        }
    }
    
}

