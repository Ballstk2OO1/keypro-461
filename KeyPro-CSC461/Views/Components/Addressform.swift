//
//  Addressform.swift
//  Login
//
//  Created by YZR-M1 on 5/5/2565 BE.
//

import SwiftUI

struct Addressform: View {
    
    @State var address = ""
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8, content:{
            Text("Shipping Address")
                .font(.system(size: 20, weight: .semibold, design: .serif ))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            TextField("Address", text:$address )
                .font(.system(size: 20, weight: .semibold, design: .serif ))
                .foregroundColor(.black)
            
            Divider()
        })
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct Addressform_Previews: PreviewProvider {
    static var previews: some View {
        Addressform()
    }
}
