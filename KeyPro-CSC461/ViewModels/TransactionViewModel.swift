//
//  TransactionViewModel.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 5/5/2565 BE.
//

import Alamofire

struct TransactionViewModel {
    
    public func getAll(completion: @escaping (Result<switchDataModel, ServiceError>) -> Void) {
        
        let headers: HTTPHeaders = ["Authorization" : AppUtils.getUsrAuthToken()!,
                                    "Content-Type": "application/json"]
        
        let request = AF.request(Constants.BASE_URL + Constants.TRANSACTION_DATA, method: .get, headers: headers)
        
        request.responseDecodable(of: responseSwitchDataModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                
                if data.result == "OK" {
                    let switchData:switchDataModel = data.data
                    completion(.success(switchData))
                }
                else if data.result == "nOK" {
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.message)))
                }
                else {
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
    
    public func create(reqObj: requestCreateTransactionModel,then completion: @escaping (Result<createTransactionDataModel, ServiceError>) -> Void) {
        
        let headers: HTTPHeaders = ["Authorization" : AppUtils.getUsrAuthToken()!,
                                    "Content-Type": "application/json"]
        
        let request = AF.request(Constants.BASE_URL + Constants.TRANSACTION_CREATE, method: .post, parameters: reqObj, encoder: JSONParameterEncoder.default, headers: headers)
        
        request.responseDecodable(of: responseCreateTransactionModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                
                if data.result == "OK" {
                    let transactionData:createTransactionDataModel = data.data
                    completion(.success(transactionData))
                }
                else if data.result == "nOK" {
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.message)))
                }
                else if data.result == "Not found" {
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.result)))
                }
                else {
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
    
    public func getHistory(completion: @escaping (Result<historyDataModel, ServiceError>) -> Void) {
        
        let headers: HTTPHeaders = ["Authorization" : AppUtils.getUsrAuthToken()!,
                                    "Content-Type": "application/json"]
        
        let request = AF.request(Constants.BASE_URL + Constants.TRANSACTION_GET_HISTORY, method: .get, headers: headers)
        
        request.responseDecodable(of: responseTransactionHistoryDataModel.self) { (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return}
                
                if data.result == "OK" {
                    let historyData:historyDataModel = data.data
                    completion(.success(historyData))
                }
                else if data.result == "nOK" {
                    completion(.failure(ServiceError.BackEndError(errorMessage: data.message)))
                }
                else {
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
    
    public func get(reqObj: requestGetTransactionModel, then completion: @escaping (Result<transactionDataModel,ServiceError>) -> Void) {
            
            let headers: HTTPHeaders = ["Authorization" : AppUtils.getUsrAuthToken()!,
                                        "Content-Type": "application/json"]
            
        let request = AF.request(Constants.BASE_URL + Constants.TRANSACTION_GET, method: .post, parameters: reqObj, encoder: JSONParameterEncoder.default, headers: headers)
            
            request.responseDecodable(of: responseGetTransactionDataModel.self) { (response) in
                switch response.result {
                case .success(_):
                    guard let data = response.value else {return}
                    
                    if data.result == "OK" {
                        let transactionData:transactionDataModel = data.data
                        completion(.success(transactionData))
                    }
                    else if data.result == "nOK" {
                        completion(.failure(ServiceError.BackEndError(errorMessage: data.message)))
                    }
                    else if data.result == "Not found" {
                        completion(.failure(ServiceError.BackEndError(errorMessage: data.result)))
                    }
                    else {
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
