//
//  RoomsController.swift
//  Roomy
//
//  Created by Isaac Karam on 4/23/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class RoomsController: UIViewController {

    //MARKS:- Properties
    let roomCellId = "RoomCell"
    var rooms = [Room]()
    
    //MARKS:- Outlets
    @IBOutlet private weak var roomTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCustomCells()
        fetchRooms()
    }

}

//MARKS- private Functions.
extension RoomsController{
    private func registerCustomCells() {
        roomTableView.register(UINib(nibName: roomCellId, bundle: nil), forCellReuseIdentifier: roomCellId)
    }
    
    private func fetchRooms(){
        let roomsList = RealmManager.fetchRooms()
        // check if database contain Rooms
        if roomsList.isEmpty{
            // get rooms From Api
       RoomyAPI.requestRoomsList(completionHandler: hanleRoomsListResponse(rooms:error:))
        }else{
            self.rooms = roomsList
            self.roomTableView.reloadData()
        }
    }
    
   private func hanleRoomsListResponse(rooms : [Room], error : Error?){
        self.rooms = rooms
    RealmManager.saveRooms(rooms: rooms)
    self.roomTableView.reloadData()
//        DispatchQueue.main.async {
//            
//        }
    }
    
    private func gotoRoomDescriotion(at index : Int){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let roomDetails = storyboard.instantiateViewController(identifier: "RoomDetailsViewController") as! RoomDetailsViewController
        let details = rooms[index].roomDescription ?? "no description"
        roomDetails.setRoomDetails(roomDetails: details)
        roomDetails.modalPresentationStyle = .fullScreen
            self.present(roomDetails, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource Functions
extension RoomsController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = roomTableView.dequeueReusableCell(withIdentifier: roomCellId) as! RoomCell
        let room = rooms[indexPath.row]
        cell.configureCell(title: room.title, price: room.price, place: room.place)
        return cell
    }
}

//MARK:- UITableviewDelegate Functions
extension RoomsController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gotoRoomDescriotion(at: indexPath.row)
    }
}

