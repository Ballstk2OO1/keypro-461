//
//  User.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 5/5/2565 BE.
//

import Foundation

struct requestRegisterModel: Encodable {
    var username: String?
    var password: String?
    var email: String?
    var name: requestNameModel?
}

struct requestNameModel: Encodable {
    var firstname: String?
    var lastname: String?
}

struct responseUserAuthModel: Codable {
    let result: String
    let message: String
    let data: userAuthModel
}

struct userAuthModel: Codable {
    var username: String?
    var email: String?
    var name: nameModel?
}

struct nameModel: Codable {
    var firstname: String?
    var lastname: String?
}

struct requestLoginModel: Encodable {
    var username: String?
    var password: String?
}
