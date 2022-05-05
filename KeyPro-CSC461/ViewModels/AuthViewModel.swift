//
//  AuthViewModel.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 5/5/2565 BE.
//

import Alamofire

struct AuthViewModel {
    public func register(reqObject: requestRegisterModel, then completion: @escaping(Result<userAuthModel, ServiceError>) -> Void) {
        let req = AF.request(Constants.BASE_URL + Constants.AUTH_REGISTER, method: .post, parameters: reqObject, encoder: JSONParameterEncoder.default)
        req.responseDecodable(of: responseUserAuthModel.self) { res in
            switch res.result {
            case .success(_):
                guard let data = res.value else { return }
                if data.result == "OK" {
                    let userData: userAuthModel = data.data
                    completion(.success(userData))
                } else if data.result == "nOK" {
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.message)))
                } else {
                    completion(.failure(ServiceError.Non200StatusCodeError(KeyProAPIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }
    
    public func login(reqObject: requestLoginModel, then completion: @escaping(Result<userAuthModel, ServiceError>) -> Void) {
        let req = AF.request(Constants.BASE_URL + Constants.AUTH_LOGIN, method: .post, parameters: reqObject, encoder: JSONParameterEncoder.default)
        req.responseDecodable(of: responseUserAuthModel.self) { res in
            switch res.result {
            case .success(_):
                guard let data = res.value else { return }
                if data.result == "OK" {
                    let userData: userAuthModel = data.data
                    let token = res.response?.allHeaderFields["Authorization"] as? String
                    AppUtils.saveUsrAuthToken(token: token ?? "")
                    completion(.success(userData))
                } else if data.result == "nOK" {
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.message)))
                } else {
                    completion(.failure(ServiceError.Non200StatusCodeError(KeyProAPIError(message: data.result, status: "500"))))
                }
            case .failure(let error):
                if let afError = error.asAFError {
                    switch afError {
                    case .sessionTaskFailed(let sessionError):
                        if let urlError = sessionError as? URLError, urlError.code == .notConnectedToInternet {
                            completion(.failure(ServiceError.NoNetworkError))
                        }
                        else {
                            completion(.failure(ServiceError.UnParsableError))
                        }
                    default :
                        completion(.failure(ServiceError.UnParsableError))
                    }
                }
                completion(.failure(ServiceError.UnParsableError))
            }
        }
    }
}
