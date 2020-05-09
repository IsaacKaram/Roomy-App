//
//  SignupController.swift
//  Roomy
//
//  Created by Isaac Karam on 5/7/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SignupController: UIViewController {

    //MARKS:- Outlets
    @IBOutlet private weak var txtUsername: UITextField!
    @IBOutlet private weak var txtEmail: UITextField!
    @IBOutlet private weak var txtPassword: UITextField!
    
    @IBOutlet private weak var activityIndicator: NVActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
    }
    
    
    @IBAction private func signupClick(_ sender: Any) {
        activityIndicator.startAnimating()
        RoomyAPI.signupNewUser(username: txtUsername.text ?? "", email: txtEmail.text ?? "", password: txtPassword.text ?? "", completion: handleSignup(result:))
    }
    
    
    @IBAction func signinClick(_ sender: Any) {
    gotoSigninView()
    }
    
}

//MARKS:- Private Function
extension SignupController{
    private func setupScreen(){
        txtUsername.setBottomBorder()
        txtEmail.setBottomBorder()
        txtPassword.setBottomBorder()
        
        activityIndicator.type = .ballClipRotatePulse
    }
    
    private func handleSignup(result : Result<Bool, Error>){
     activityIndicator.stopAnimating()
         switch result{
         case.success(let success):
             if success{
               gotoRoomsView()
             }else{
               showAlert(title: "Signup Error", message: "Invalid inputs")
             }
         case.failure(_):
             showAlert(title: "Signup Error", message: "there's problem, Please try again later!")
         }
         
     }
     
    private func gotoRoomsView(){
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let roomsView = storyboard.instantiateViewController(identifier: "RoomsController") as! RoomsController
     roomsView.modalPresentationStyle = .fullScreen
         self.present(roomsView, animated: true, completion: nil)
         
     }
    
    private func gotoSigninView(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let signinView = storyboard.instantiateViewController(identifier: "LoginController") as! LoginController
        signinView.modalPresentationStyle = .fullScreen
            self.present(signinView, animated: true, completion: nil)
    }
}
