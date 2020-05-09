//
//  SignInResponse.swift
//  Roomy
//
//  Created by Isaac Karam on 4/18/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation

struct SigninResponse : Codable {
    var userToken : String {return token ?? ""}
    var message : String {return errorMessage ?? ""}
    
    private var token : String?
    private var errorMessage : String?
    enum CodingKeys : String, CodingKey {
        case token = "auth_token"
        case errorMessage = "message"
    }
}
