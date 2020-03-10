//
//  ViewController.swift
//  Roomy
//
//  Created by User on 3/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTxt.setBottomBorder()
        passwordTxt.setBottomBorder()
    }


}

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
