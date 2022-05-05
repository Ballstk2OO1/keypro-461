//
//  MyOrder.swift
//  Login
//
//  Created by YZR-M1 on 5/5/2565 BE.
//

import SwiftUI

struct MyOrder: View {
    var body: some View {
        VStack {
           
            Text("My Orders")
                .font(.system(size: 28, weight: .bold, design: .serif))
                .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                .frame(alignment: .leading)
                .padding(.top, 5)
            Divider()
            
            VStack{
            Text("Order id")
                .font(.system(size: 18, weight: .semibold, design: .serif))
                .frame(alignment: .leading)
                .foregroundColor(Color.gray)
            
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
                    }//VStack
                
                Button(action: {}, label: {
                    Image(systemName: "chevron.right")
                        .font(.title)
                        .foregroundColor(.gray)
                })//Button
                .frame(alignment: .trailing)
                
                }//HStack
            }//VStack
            
            VStack{
                Divider()
                HStack {
                    Text("1 Item")
                    Spacer()
                    Text("Total price")
                }
                Divider()
            }//VStack
            
            
            
            
            
            
            
            Spacer()
        }
        .padding()
        
        
        
        
    }
}

struct MyOrder_Previews: PreviewProvider {
    static var previews: some View {
        MyOrder()
    }
}
