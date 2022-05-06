//
//  AddToCart.swift
//  cart
//
//  Created by YZR-M1 on 1/5/2565 BE.
//

import SwiftUI

struct AddToCart: View {
    
    @EnvironmentObject var cartManager: CartManager
    @Binding public var counter : Int
    var product : Product
    
    var body: some View {
        Button(action: {
            cartManager.addToCart(product: product, counter: counter)
        }, label: {
            Text("Add to cart".uppercased())
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        })//BUTTON
        .padding(15)
        .background(Color.black)
        .cornerRadius(30)
    }
}

struct AddToCart_Previews: PreviewProvider {
    static var previews: some View {
        AddToCart(counter: .constant(0), product: Product(name: "", image: "", price: 0.0))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
