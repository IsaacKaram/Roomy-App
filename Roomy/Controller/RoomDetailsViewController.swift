//
//  RoomDetailsViewController.swift
//  Roomy
//
//  Created by Isaac Karam on 5/8/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class RoomDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblDescription: UILabel!
    private var roomDetails : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDescription.text = roomDetails
    }
    @IBAction private func backToRoomsClick(sender : UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK:- Private Functions.
extension RoomDetailsViewController{
    internal func setRoomDetails(roomDetails : String){
        self.roomDetails = roomDetails
    }
}
