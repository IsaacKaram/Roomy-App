//
//  ViewController.swift
//  Roomy
//
//  Created by User on 3/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoginController: UIViewController {
    
    @IBOutlet private weak var activityIndicator: NVActivityIndicatorView!
    @IBOutlet private weak var txtUsername: UITextField!
    @IBOutlet private weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    
    @IBAction func signinClick(_ sender: UIButton) {
        activityIndicator.startAnimating()
        RoomyAPI.loginUser(userEmail: txtUsername.text ?? "", password: txtPassword.text ?? "", completionHandler: handleLogin(result:))
    }
    
    @IBAction func signupClick(_ sender: Any) {
        gotoSignup()
    }
    
    
}


//MARK:- Private Functions
extension LoginController {
    private func setupScreen(){
        txtUsername.setBottomBorder()
        txtPassword.setBottomBorder()
        activityIndicator.type = .ballClipRotatePulse
    }
    
    private func handleLogin(result : Result<Bool, Error>){
        activityIndicator.stopAnimating()
        switch result{
        case.success(let success):
            if success{
                gotoRoomsView()
            }else{
                showAlert(title: "Login Error", message: "Invalid credintials")
            }
        case.failure(_):
            showAlert(title: "Login Error", message: "there's problem, Please try again later!")
        }
        
    }
    
    private func gotoRoomsView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let roomsView = storyboard.instantiateViewController(identifier: "RoomsController") as! RoomsController
        roomsView.modalPresentationStyle = .fullScreen
        self.present(roomsView, animated: true, completion: nil)
        
    }
    
    private func gotoSignup(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupView = storyboard.instantiateViewController(identifier: "SignupController") as! SignupController
        signupView.modalPresentationStyle = .fullScreen
        self.present(signupView, animated: true, completion: nil)
    }
}
