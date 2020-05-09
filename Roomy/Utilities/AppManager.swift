//
//  AppManager.swift
//  Roomy
//
//  Created by Isaac Karam on 4/20/20.
//  Copyright © 2020 User. All rights reserved.
//

import Foundation
import KeychainSwift
class AppManager{
    
    static let userTokenId = "Token"
    
    internal class func saveUserToken(userToken : String){
        let keychain = KeychainSwift()
        keychain.set(userToken, forKey: userTokenId)
    }
    
    internal class func retrieveUserToken() -> String? {
        let keychain = KeychainSwift()
        return keychain.get(userTokenId)
    }
}
