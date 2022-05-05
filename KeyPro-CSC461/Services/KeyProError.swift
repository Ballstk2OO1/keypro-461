//
//  KeyProError.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 5/5/2565 BE.
//

import Foundation

public enum ServiceError:Error {
    case UnParsableError
    case Non200StatusCodeError(KeyProAPIError)
    case BackEndError(errorMessage:String)
    case NoNetworkError
}

public struct KeyProAPIError:Decodable {
    var message:String?
    var status:String?
}
