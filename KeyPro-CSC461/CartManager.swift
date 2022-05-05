//
//  CartManager.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 4/5/2565 BE.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Double = 0
    
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func addToCart(product: Product, counter: Int) {
        for _ in 0..<counter {
            products.append(product)
            total += product.price
        }
    }
    
    func removeFromCart(product: Product, index: Int) {
//        products = products.filter { $0.id != product.id }
        products.remove(at: index)
        total -= product.price
    }
}
