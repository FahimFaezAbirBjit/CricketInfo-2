//
//  tb.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 11/2/23.
//

import Foundation
import UIKit
class TransparentTabBar: UITabBar {
  override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { return }
    context.setFillColor(UIColor.clear.cgColor)
    context.fill(bounds)
    layer.backgroundColor = UIColor.clear.cgColor
    super.draw(rect)
  }
}
