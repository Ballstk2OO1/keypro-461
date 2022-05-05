//
//  QuantityFavView.swift
//  cart
//
//  Created by YZR-M1 on 1/5/2565 BE.
//

import SwiftUI

struct QuantityFavView: View {
    
    @Binding public var counter : Int
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Button(action: {
                if counter > 0 {
                    counter -= 1
                }
            }, label: {
                Image(systemName: "minus.circle")
            })
            
            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)
            
            Button(action: {
                if counter < 100 {
                    counter += 1
                }
            }, label: {
                Image(systemName: "plus.circle")
            })
            
        Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "heart.circle")
                    .foregroundColor(.red)
            })
            
        })//HSTACK
        .font(.title)
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

struct QuantityFavView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityFavView(counter: .constant(0))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
