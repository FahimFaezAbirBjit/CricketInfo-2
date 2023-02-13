//
//  CustomTabBar.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 9/2/23.
//

import UIKit

class CustomTabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tabBar.layer.cornerRadius = 30
        
                let layer = CAShapeLayer()
                print(tabBar.bounds.minY)
                layer.path = UIBezierPath(roundedRect: CGRect(x: 20, y: tabBar.bounds.minY, width:tabBar.bounds.width-40, height: tabBar.bounds.height+5), cornerRadius: 20).cgPath
                layer.fillColor = UIColor(named: "customColor")?.cgColor
                tabBar.layer.insertSublayer(layer, at: 0)
    }
    
//    func customBar(){
//        let layer = CAShapeLayer()
//        layer.path = UIBezierPath(roundedRect: CGRect(x: 30, y: self.tabBar.bounds.minY, width: self.tabBar.bounds.width - 60, height: self.tabBar.bounds.height + 10), cornerRadius: (self.tabBar.frame.width/2)).cgPath
//        layer.shadowColor = UIColor.lightGray.cgColor
//        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
//        layer.shadowRadius = 25.0
//        layer.shadowOpacity = 0.3
//        layer.borderWidth = 1.0
//        layer.opacity = 1.0
//        layer.isHidden = false
//        layer.masksToBounds = false
//        layer.fillColor = UIColor.white.cgColor
//
//        self.tabBar.layer.insertSublayer(layer, at: 0)
//        let window = UIApplication.shared.connectedScenes
//            .filter({$0.activationState == .foregroundActive})
//            .compactMap({$0 as? UIWindowScene})
//            .first?.windows
//            .filter({$0.isKeyWindow}).first
//        var  bottomPadding = window?.safeAreaInsets.bottom ?? 50
//        bottomPadding = bottomPadding > 0 ? 0 : 500
//        additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: bottomPadding, right: 0)
//    }
}
