//
//  RoomyAPI.swift
//  Roomy
//
//  Created by Isaac Karam on 4/10/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import Alamofire

class RoomyAPI{
    enum Endpoint  : String{
        case login = "https://roomy-application.herokuapp.com/auth/login"
        case signUp = "https://roomy-application.herokuapp.com/signup"
        case addRoom_RoomsList = "https://roomy-application.herokuapp.com/rooms"
        
        var url : URL{
            return URL(string: self.rawValue)!
        }
    }
    
    class func signupNewUser(username : String, email : String, password : String, completion : @escaping (Result<Bool, Error>) -> Void){
        let signupEndpoint = Endpoint.signUp.url
        let parameters = [
            "name" : username,
            "email" : email,
            "password" : password
        ]
        sendLogin_SignupRequest(signupEndpoint, parameters, completion)
    }
    
    fileprivate static func sendLogin_SignupRequest(_ loginEndpoint: URL, _ parameters: [String : String], _ completionHandler: @escaping (Result<Bool, Error>) -> Void) -> DataRequest {
        return AF.request(loginEndpoint,method: .post ,parameters: parameters ).responseData { (response) in
            switch response.result{
            case .success(let data):
                let decoder = JSONDecoder()
                do{
                    let signinResponse = try decoder.decode(SigninResponse.self, from: data)
                    if signinResponse.userToken.isEmpty{
                        completionHandler(.success(false))
                    }else{
                        AppManager.saveUserToken(userToken: signinResponse.userToken)
                        completionHandler(.success(true))
                    }
                    
                }catch{
                    completionHandler(.success(false))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    class func loginUser(userEmail : String, password : String, completionHandler : @escaping (Result<Bool , Error>) -> Void){
        let loginEndpoint = Endpoint.login.url
        let parameters = [
            "email" : userEmail,
            "password" : password
        ]
        sendLogin_SignupRequest(loginEndpoint, parameters, completionHandler)
        
    }
    
    class func requestRoomsList(completionHandler: @escaping ([Room], Error?)->Void){
        guard let auth = AppManager.retrieveUserToken() else {return}
        
        let headers: HTTPHeaders = [
            "Authorization": auth,
            "Accept": "application/json"
        ]
        
        let roomsListEndpoint = Endpoint.addRoom_RoomsList.url
        AF.request(roomsListEndpoint, headers: headers).responseData { (response) in
            switch response.result{
            case .success(let data):
                let decoder = JSONDecoder()
                do{
                    let roomsList = try decoder.decode([Room].self
                        , from: data)
                    completionHandler(roomsList, nil)
                }catch{
                    completionHandler([], error)
                    print("erro decoding : \(error)")
                }
            case .failure(let error):
                completionHandler([], error)
                print("\(error)")
            }
        }
    }
    
}


