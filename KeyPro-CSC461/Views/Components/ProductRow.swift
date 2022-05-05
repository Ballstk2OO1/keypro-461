//
//  ProductRow.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 4/5/2565 BE.
//

import SwiftUI
import Kingfisher

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var index: Int
    @State var isDeletable: Bool = true
    
    var body: some View {
        HStack(spacing: 20) {
            let url = URL(string: product.image)
            let processor = ResizingImageProcessor(referenceSize: .init(width: 50, height: 50), mode: .aspectFill)
            KFImage.url(url)
                .placeholder({
                    HStack{
                        ProgressView()
                    }
                    .padding()
                    .frame(width: 50, height: 50)
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
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fill)                
            
            VStack(alignment: .leading, spacing: 10) {
                Text("\(product.name)")
                    .bold()
                
                Text(String(format: "%.2f฿", product.price))
            }
            
            Spacer()
            
            if isDeletable {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .onTapGesture {
                        cartManager.removeFromCart(product: product, index: index)
                    }
            } 
        }
        .padding()
        .frame(width: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: Product(name: "Glorious", image: "Glorious-Panda", price: 10), index: 0)
            .environmentObject(CartManager())
    }
}
