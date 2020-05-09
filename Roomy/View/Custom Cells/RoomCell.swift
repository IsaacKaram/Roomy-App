//
//  RoomCell.swift
//  Roomy
//
//  Created by Isaac Karam on 4/21/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {

    @IBOutlet weak var customBackgroundView: UIView!
    @IBOutlet private weak var roomTile: UILabel!
    @IBOutlet private weak var roomPrice: UILabel!
    @IBOutlet private weak var roomPlace: UILabel!
    
    @IBOutlet weak var roomImgHeightConstraints: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        customBackgroundView.layer.cornerRadius = 10.0
    }
    
    func configureCell(title : String, price : String, place : String){
        roomTile.text = title
        roomPlace.text = place
        roomPrice.text = price
    }
}
