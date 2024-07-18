//
//  UserDefaultsManager.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 18/07/24.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let loginToken = "loginToken"
    
    private init() {}
    
    func saveLoginToken(_ name: String) {
        UserDefaults.standard.set(name, forKey: loginToken)
    }
    
    func getLoginToken() -> String {
        return UserDefaults.standard.string(forKey: loginToken) ?? ""
    }
    

}
