//
//  Constants.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 5/5/2565 BE.
//

import Foundation
import SwiftUI

struct Constants {
    static let BASE_URL = "https://keypro-461.herokuapp.com/api"
    static let ENDPOINT = "https://keypro-461.herokuapp.com"
    static let AUTH_REGISTER = "/auth/register"
    static let AUTH_LOGIN = "/auth/login"
    
    static let TRANSACTION_DATA = "/transaction/data"
    static let TRANSACTION_CREATE = "/transaction/create"
    static let TRANSACTION_GET_HISTORY = "/transaction/history"
    static let TRANSACTION_GET = "/transaction/get"
    
    struct AppConstants {
        static let CUR_USR_TOKEN = "UserAuthToken"
        static let CUR_USR_USERNAME = "UserUsername"
        static let CUR_USR_EMAIL = "UserEmail"
        static let CUR_USR_NAME = "UserName"
        static let CUR_USR_ADDRESS = "UserAddress"
    }
}
