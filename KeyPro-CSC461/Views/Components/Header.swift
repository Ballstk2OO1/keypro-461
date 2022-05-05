//
//  Header.swift
//  cart
//
//  Created by YZR-M1 on 1/5/2565 BE.
//

import SwiftUI

struct Header: View {
    var name : String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            Text(name)
                .font(.largeTitle)
                .fontWeight(.black)
        }) //<-- VSTACK
        .foregroundColor(.black)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(name: "Test")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
