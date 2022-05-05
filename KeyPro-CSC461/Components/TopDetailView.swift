//
//  TopDetailView.swift
//  cart
//
//  Created by YZR-M1 on 1/5/2565 BE.
//

import SwiftUI
import Kingfisher

struct TopDetailView: View {
    
    @State private var isAnimating: Bool = false
    var image : String = ""
    var price : Double = 0.0
    
    var body: some View {
        HStack(alignment: .center, spacing: 6, content: {
            //PRICE
            VStack(alignment: .leading, spacing: 6, content: {
            Text("Price")
                .fontWeight(.semibold)
            
            Text(String(format: "%.2f", price))
                .font(.largeTitle)
                .fontWeight(.black)
                .scaleEffect(1.35, anchor: .leading)
        })
        .offset(y: isAnimating ? -50 : -75)
        
            Spacer()
        
            //PHOTO
//            Image(image)
//                .resizable()
//                .frame(width: 180, height: 180)
//                .offset(y: isAnimating ? 0 : -35)
            let url = URL(string: image)
            let processor = ResizingImageProcessor(referenceSize: .init(width: 180, height: 180), mode: .aspectFill)
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
                .aspectRatio(contentMode: .fill)
                .offset(y: isAnimating ? 0 : -35)
            
        })// <-- HSTACK
        .onAppear(perform: {
            withAnimation(.easeOut(duration: 0.75)) {
                isAnimating.toggle()
            }
        })
        
    }
}

struct TopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopDetailView(image: "", price: 0.0)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
