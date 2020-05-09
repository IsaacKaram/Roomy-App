//
//  Room.swift
//  Roomy
//
//  Created by Isaac Karam on 4/12/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import RealmSwift

class Room : Object ,Codable{
    @objc dynamic var id : Int
    @objc dynamic var title : String
    @objc dynamic var price : String
    @objc dynamic var place : String
    @objc dynamic var roomDescription : String?
    
    enum CodingKeys : String, CodingKey{
        case id
        case title
        case price
        case place
        case roomDescription = "description"
    }
}
