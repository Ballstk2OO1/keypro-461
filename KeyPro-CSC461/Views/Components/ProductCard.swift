//
//  ProductCard.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 4/5/2565 BE.
//

import SwiftUI
import Kingfisher

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                VStack {
                    let url = URL(string: product.image)
                    let processor = ResizingImageProcessor(referenceSize: .init(width: 180, height: 180), mode: .aspectFit)
                    KFImage.url(url)
                        .placeholder({
                            HStack{
                                ProgressView()
                            }
                            .padding()
                            .frame(width: 180, height: 180)
                        })
                        .setProcessor(processor)
                        .loadDiskFileSynchronously()
                        .cacheMemoryOnly()
                        .fade(duration: 0.25)
                        .onProgress { receivedSize, totalSize in  }
                        .onSuccess { result in
                            print("SUCCESS LOAD IMAGE",result)
                        }
                        .onFailure { error in print("ERROR LOAD IMAGE",error) }
                        .resizable()
                        .frame(width: 180, height: 180)
                        .aspectRatio(contentMode: .fit)
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .bold()
                        
                        Text(String(format: "%.2f฿", product.price))
                            .font(.caption)
                    }
                    .padding()
                    .frame(width: 180, alignment: .leading)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                }
                .frame(width: 180, height: 250, alignment: .top)
                .background(.white)
                .cornerRadius(20)
//                    .aspectRatio(contentMode: .fill)
                
                
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding()
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: Product(name: "Glorious", image: "Glorious-Panda", price: 10))
            .environmentObject(CartManager())
    }
}
