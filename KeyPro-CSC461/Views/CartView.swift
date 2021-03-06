//
//  CartView.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 4/5/2565 BE.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack(spacing: 10) {
            ScrollView {
                if cartManager.products.count > 0 {
                    
                    ForEach(0..<cartManager.products.count, id: \.self) { index in ProductRow(product: cartManager.products[index], index: index) }
                    
                } else {
                    Text("Your cart is empty")
                }
            }
            .navigationTitle("My Cart")
            .padding(.top)
            
            if cartManager.products.count > 0 {
                HStack {
                    Text("Total")
                    Spacer()
                    Text(String(format: "%.2f฿", cartManager.total))
                        .bold()
                }
                .padding()
                
                NavigationLink {
                    Checkout()
                        .environmentObject(cartManager)
                } label: {
                    PaymentButton(action: {})
                        .padding()
                }
            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
