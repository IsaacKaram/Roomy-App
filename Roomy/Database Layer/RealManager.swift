//
//  RealManager.swift
//  Roomy
//
//  Created by Isaac Karam on 5/9/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager{
    private static let realm = try! Realm()
    
    static func saveRooms(rooms: [Room]) {
        try! realm.write {
            realm.add(rooms)
        }
    }
    
    static func fetchRooms() -> [Room] {
        let rooms = realm.objects(Room.self)
        var roomsArray = [Room]()
        for room in rooms {
            roomsArray.append(room)
        }
        return roomsArray
    }
}
