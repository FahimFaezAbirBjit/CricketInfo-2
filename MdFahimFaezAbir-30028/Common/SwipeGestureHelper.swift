//
//  SwipeGestureHelper.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 15/2/23.
//

import Foundation
import UIKit

class SwipeGestureHelper{
    let segmentController: UISegmentedControl
    let views: [UIView]
    let selectedTextAttributes: [NSAttributedString.Key: Any]
    let normalTextAttributes: [NSAttributedString.Key: Any]
    let view: UIView
    init(segmentController: UISegmentedControl, views: [UIView], selectedTextAttributes: [NSAttributedString.Key: Any], normalTextAttributes: [NSAttributedString.Key: Any], view: UIView) {
        self.segmentController = segmentController
        self.views = views
        self.selectedTextAttributes = selectedTextAttributes
        self.normalTextAttributes = normalTextAttributes
        self.view = view
        gestureController()
    }
    func gestureController(){
        segmentController.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
    @objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
        updateContainerViews(for: sender.selectedSegmentIndex)
    }
    
    @objc private func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case .left:
            updateContainerViews(for: segmentController.selectedSegmentIndex + 1)
        case .right:
            updateContainerViews(for: segmentController.selectedSegmentIndex - 1)
        default:
            break
        }
    }
    
    private func updateContainerViews(for selectedSegmentIndex: Int) {
        guard selectedSegmentIndex >= 0, selectedSegmentIndex < views.count else {
            return
        }
        
        changeView(selected: selectedSegmentIndex)
        segmentController.selectedSegmentIndex = selectedSegmentIndex
    }
    
    private func changeView(selected: Int){
        for (index, view) in views.enumerated() {
            if index == selected {
                view.isHidden = false
                //view.alpha = 1
                segmentController.setTitleTextAttributes(selectedTextAttributes, for: .selected)
            } else {
                view.isHidden = true
                //view.alpha = 0
                segmentController.setTitleTextAttributes(normalTextAttributes, for: .normal)
            }
        }
    }
    
}
