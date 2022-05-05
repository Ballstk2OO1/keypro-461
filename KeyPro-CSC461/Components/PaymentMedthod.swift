//
//  PaymentMedthod.swift
//  Login
//
//  Created by YZR-M1 on 5/5/2565 BE.
//

import SwiftUI

struct PaymentMedthod: View {
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8, content:{
            Text("Payment Method")
                .font(.system(size: 20, weight: .semibold, design: .serif ))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
          
            
            Divider()
            
            VStack{
                
                Group {
                    Toggle("ชำระผ่าน QR Code", isOn: $isSelected)
                }
                
            
            }
            
            
        })
    }
}

struct PaymentMedthod_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMedthod()
    }
}
