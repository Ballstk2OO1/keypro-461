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
                let url = URL(string: product.image)
                let processor = ResizingImageProcessor(referenceSize: .init(width: 400,height:400), mode: .aspectFill)
                KFImage.url(url)
                    .placeholder({
                        HStack{
                            ProgressView()
                        }
                        .padding()
                        .frame(width: 180, height: 250)
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
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 180, height: 250)
                    .aspectRatio(contentMode: .fill)
                
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
