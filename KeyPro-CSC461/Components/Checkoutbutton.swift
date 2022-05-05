//
//  Checkoutbutton.swift
//  Login
//
//  Created by YZR-M1 on 5/5/2565 BE.
//

import SwiftUI

struct Checkoutbutton: View {
    
    
    var body: some View {
        Button(action: {}, label: {
            Text("Check Out")
                .font(.system(size: 28, weight: .bold, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
        })//BUTTON
        .padding(15)
        .background(Color.black)
        .cornerRadius(20)
    }
}

struct Checkoutbutton_Previews: PreviewProvider {
    static var previews: some View {
        Checkoutbutton()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
