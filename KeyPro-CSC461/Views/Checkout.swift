//
//  Checkout.swift
//  Login
//
//  Created by YZR-M1 on 5/5/2565 BE.
//

import SwiftUI

struct Checkout: View {
    
    @State var isSelected: Bool = false
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text("Check Out")
                    .font(.system(size: 28, weight: .bold, design: .serif))
                    .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                    .padding(.top, 5)
                Spacer()
            }
            .padding()
        }
        
        Addressform()
            .padding()
        
        PaymentMedthod()
            .padding()
                        
        VStack (alignment: .leading, spacing: 8, content:{
            Text("Order")
                .font(.system(size: 20, weight: .semibold, design: .serif ))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Divider()
            
            HStack(spacing: 20) {
                Image("s3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Cherry Red")
                        .bold()
                    
                    Text(String("500"))
                }
                
                Spacer()
            }
            
        })
        .padding()
        
        NavigationLink {
            MyOrder()
        } label: {
//            Checkoutbutton()
//                .padding(.top,250)
//                .zIndex(1)
            PaymentButton(action: {})
                .padding()
        }        
    }
    
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}


