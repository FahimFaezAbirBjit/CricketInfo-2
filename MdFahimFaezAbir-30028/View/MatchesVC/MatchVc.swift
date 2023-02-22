//
//  MatchVc.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 15/2/23.
//

import UIKit

class MatchVc: UIViewController {
   //MARK: - Outlet
    @IBOutlet weak var liveView: UIView!
    @IBOutlet weak var upcomingView: UIView!
    @IBOutlet weak var recentView: UIView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    //MARK: - Variable
    let normalTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.foregroundColor: UIColor.white
    ]
    let selectedTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.foregroundColor: UIColor.black
    ]
    var swipeGestureHelper: SwipeGestureHelper?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        tabBarController?.tabBar.isHidden = false
//        networkView.alpha = 0
//        liveView.alpha = 1
//        upcomingView.alpha = 0
//        recentView.alpha = 0
      //  networkView.isHidden = true
        liveView.isHidden = false
        upcomingView.isHidden = true
        recentView.isHidden = true
        segmentController.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        segmentController.setTitleTextAttributes(normalTextAttributes, for: .normal)
        let views = [liveView!, upcomingView!,recentView!]
        let swipeGesture = SwipeGestureHelper(segmentController: segmentController, views: views, selectedTextAttributes: selectedTextAttributes, normalTextAttributes: normalTextAttributes, view: self.view)
        self.swipeGestureHelper = swipeGesture
    }
  
    
}
