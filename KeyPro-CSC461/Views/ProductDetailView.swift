//
//  ProductDetailView.swift
//  cart
//
//  Created by YZR-M1 on 1/5/2565 BE.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject var cartManager: CartManager
    @State private var counter : Int = 0
    
    var product : Product
    
    var body : some View {
        
        VStack(alignment: .leading, spacing: 5, content: {
            //NAVBAR
            //            NavigationBar()
            //                .padding(.horizontal)
            //                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            //HEADER
//            Header(name: product.name)
//                .padding(.horizontal)
            //DETAIL TOP
            TopDetailView(image: product.image, price: product.price)
                .padding(.horizontal)
                .zIndex(1)
            //DETAIL BOTTOM
            VStack(alignment: .center, spacing: 6, content: {
                //DESCRIPTION
                ScrollView(.vertical, showsIndicators: false, content: {
                    Text(product.description ?? "")
                        .padding()
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                })
                
                //QUANTITY,FAV
                QuantityFavView(counter: $counter)
                    .padding(.vertical, 10)
                //ADD TO CART
                
                AddToCart(counter: $counter, product: product)
                    .padding(.bottom, 20)
                    .environmentObject(cartManager)
                
                
            })//:VSTACK
            .padding(.horizontal)
            .background(Color(UIColor.systemTeal).opacity(0.3))
            .clipShape(CustomShape())
            .padding(.top)
            
            
        })//VSTACK
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.white)
        .navigationTitle(Text(product.name))
        .toolbar {
            NavigationLink {
                CartView()
                    .environmentObject(cartManager)
            } label: {
                CartButton(numberOfProduct: cartManager.products.count)
            }
        }
    }
    
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(name: "test", image: "Glorious-Lynx", price: 0))
            .previewLayout(.fixed(width: 375, height: 812))
    }
}

