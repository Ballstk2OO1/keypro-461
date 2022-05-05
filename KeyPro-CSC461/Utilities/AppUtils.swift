//
//  AppUtils.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 5/5/2565 BE.
//

import Foundation
import JWTDecode

struct AppUtils {

    static func saveUsrAuthToken(token:String) {
        UserDefaults.standard.setValue(token, forKey: Constants.AppConstants.CUR_USR_TOKEN)
    }
    
    static func getUsrAuthToken() -> String? {
        return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_USR_TOKEN) as? String
    }

    //get user id userid
    static func getUsrId() -> String? {
        return AppUtils.JWT.decryptUsrAuthToken()
    }
    
    static func saveUsrUsername(username:String) {
        UserDefaults.standard.setValue(username, forKeyPath: Constants.AppConstants.CUR_USR_USERNAME)
    }
    
    static func getUsrUsername() -> String? {
        return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_USR_USERNAME) as? String
    }
    
    static func saveUsrEmail(email:String) {
        UserDefaults.standard.setValue(email, forKeyPath: Constants.AppConstants.CUR_USR_EMAIL)
    }
    
    static func getUsrEmail() -> String? {
        return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_USR_EMAIL) as? String
    }

    static func saveUsrName(firstname:String, lastname:String) {
        return UserDefaults.standard.setValue("\(firstname) \(lastname)", forKeyPath:     Constants.AppConstants.CUR_USR_NAME)
    }
    
    static func getUsrName() -> String? {
        return UserDefaults.standard.value(forKey: Constants.AppConstants.CUR_USR_NAME) as? String
    }

    static func eraseAllUsrData() {
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_USR_TOKEN)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_USR_EMAIL)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_USR_NAME)
        UserDefaults.standard.removeObject(forKey: Constants.AppConstants.CUR_USR_USERNAME)
    }

    struct JWT {
        
        static func decryptUsrAuthToken() -> String? {
            
            guard let authtoken = AppUtils.getUsrAuthToken() else {
                return nil
            }
            
            let token = authtoken.components(separatedBy: " ")[1]
            
            do {
                let jwt = try decode(jwt: token)
                let claim = jwt.claim(name: "id")
                if let id = claim.string {
                    return id
                }
            } catch {
                return nil
            }
            return nil
        }
        
    }
}
