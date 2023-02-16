//
//  ViewController+UiCustomizitaion.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 10/2/23.
//

import Foundation
import UIKit
extension ViewController{
    func uiCustomization(){
        customizeButton()
        hideNavigation()
        initialView()
        gestureConttroller()
        transparentTabbar()
    }
    func customizeButton(){
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.cornerRadius = 10
    }
    func hideNavigation(){
        navigationController?.isNavigationBarHidden = true
    }
    func initialView(){
        homeView.isHidden = false
        newsView.isHidden = true
        networkErrorView.alpha = 0
        segmentController.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        segmentController.setTitleTextAttributes(normalTextAttributes, for: .normal)
    }
    func gestureConttroller(){
        let views = [homeView!, newsView!]
        let swipeGesture = SwipeGestureHelper(segmentController: segmentController, views: views, selectedTextAttributes: selectedTextAttributes, normalTextAttributes: normalTextAttributes, view: self.view)
        self.swipeGestureHelper = swipeGesture
//        segmentController.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
//            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
//            swipeLeft.direction = .left
//            view.addGestureRecognizer(swipeLeft)
//            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
//            swipeRight.direction = .right
//            view.addGestureRecognizer(swipeRight)
    }
//    @objc func segmentedControlValueChanged(sender: UISegmentedControl) {
//        updateContainerViews(for: sender.selectedSegmentIndex)
//    }
//    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
//        switch gesture.direction {
//        case .left:
//            updateContainerViews(for: 1)
//        case .right:
//            updateContainerViews(for: 0)
//        default:
//            break
//        }
//    }
//    func updateContainerViews(for selectedSegmentIndex: Int) {
//        switch selectedSegmentIndex {
//        case 0:
//            changeView(selected: selectedSegmentIndex)
//            segmentController.selectedSegmentIndex = 0
//        case 1:
//            changeView(selected: selectedSegmentIndex)
//            segmentController.selectedSegmentIndex = 1
//        default:
//            break
//        }
//    }
    func changeView(selected: Int){
        switch selected{
        case 0:
            homeView.alpha = 1
            newsView.alpha = 0
            segmentController.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        case 1:
            homeView.alpha = 0
            newsView.alpha = 1
            segmentController.setTitleTextAttributes(normalTextAttributes, for: .normal)
        default:
            break
        }
    }
    func transparentTabbar(){
        tabBar.isTranslucent = true
        tabBar.barTintColor = .clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.backgroundColor = .clear
        tabBar.tintColor = .black
        tabBar.barStyle = .black
    }
}
