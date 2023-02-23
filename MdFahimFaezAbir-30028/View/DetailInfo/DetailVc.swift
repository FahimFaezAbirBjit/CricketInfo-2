//
//  detailVc.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 16/2/23.
//

import UIKit

class DetailVc: UIViewController {
    var detailVc = DetailVcModel()
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var squadView: UIView!
    @IBOutlet weak var scoreCardView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var liveView: UIView!
    var swipeGestureHelper: SwipeGestureHelper?
    //MARK: - Variable
    let normalTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.foregroundColor: UIColor.white
    ]
    let selectedTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.foregroundColor: UIColor.black
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        liveView.isHidden = false
        infoView.isHidden = true
        scoreCardView.isHidden = true
        squadView.isHidden = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        segmentController.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        segmentController.setTitleTextAttributes(normalTextAttributes, for: .normal)
      // setUpBindersForFixId()
      addSwipeGesture()
      setUpbindersForFlag()
    }
    func  addSwipeGesture(){
        
        let views = [infoView!, liveView!,scoreCardView!,squadView!]
        let swipeGesture = SwipeGestureHelper(segmentController: segmentController, views: views, selectedTextAttributes: selectedTextAttributes, normalTextAttributes: normalTextAttributes, view: self.view)
        self.swipeGestureHelper = swipeGesture
    }
    func setUpBindersForFixId(){
        detailVc.fixtureId.bind(listener: { [weak self] fixId in
            guard let _ =  self else {return}
           
          
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
        tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    func setUpbindersForFlag(){
        
    }
}
