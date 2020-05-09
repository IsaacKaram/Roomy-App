//
//  UITextField+Extensions.swift
//  Roomy
//
//  Created by Isaac Karam on 4/20/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

extension UITextField {
    func setBottomBorder() {
      self.borderStyle = UITextField.BorderStyle.none
      self.backgroundColor = UIColor.clear
      let width: CGFloat = 1.0

      let borderLine = UIView(frame: CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width))
      borderLine.backgroundColor = self.tintColor
      self.addSubview(borderLine)
     }
}
