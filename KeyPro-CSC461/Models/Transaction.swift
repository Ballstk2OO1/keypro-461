//
//  Transaction.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 5/5/2565 BE.
//

import Foundation

struct responseSwitchDataModel: Codable {
    let result: String
    let message: String
    let data: switchDataModel
}

struct switchDataModel: Codable {
    let switches: [switchModel]?
}

struct switchModel: Codable {
    let name: String?
    let price_per_piece: Double?
    let image: String?
    let description: String?
    let created: String?
}

struct responseCreateTransactionModel: Codable {
    let result: String
    let message: String
    let data: createTransactionDataModel
}

struct createTransactionDataModel: Codable {
    let item: [itemModel]?
    let total: Double?
    let ownerID: String?
    let created: String?
}

struct itemModel: Codable {
    let name: String?
    let image: String?
    let price_per_piece: Double?
}

struct requestCreateTransactionModel: Encodable {
    var item: [itemModel]?
    var total: Double?
}

struct responseTransactionHistoryDataModel: Codable {
    let result: String
    let message: String
    let data: historyDataModel
}

struct historyDataModel: Codable {
    let history: [historyModel]?
}

struct historyModel: Codable {
    let id: String?
    let item: [itemModel]?
    let total: Double?
    let created: String?
}

struct responseGetTransactionDataModel: Codable {
    let result: String
    let message: String
    let data: transactionDataModel
}

struct transactionDataModel: Codable {
    let id: String?
    let item: [itemModel]?
    let total: Double?
    let owner_name: String?
    let created: String?
}

struct requestGetTransactionModel: Encodable {
    var transaction_id: String?
}
