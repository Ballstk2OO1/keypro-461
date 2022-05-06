//
//  Account.swift
//  Login
//
//  Created by YZR-M1 on 6/5/2565 BE.
//

import SwiftUI

struct Account: View {
    var body: some View {
        VStack(spacing: 0) {
            AccountView()
            TabBar()
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct AccountView: View {
    var username = AppUtils.getUsrUsername() ?? ""
    var name = AppUtils.getUsrName() ?? ""
    
    var body: some View {
        VStack{
        
        Text("My Account")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.bold)
            .foregroundColor(.black)
        
            .kerning(1.9)
            .frame(maxWidth: .infinity, alignment: .center)
            Divider()
                
            
            .padding(.top,25)
        
            VStack(alignment: .trailing, spacing: 8, content: {
                Text("Hi, \(username)")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Divider()
                
            })
            .padding(.top,25)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Firstname : \(name.components(separatedBy: " ")[0])")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Divider()
                
            })
            .padding(.top,25)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Lastname : \(name.components(separatedBy: " ")[1])")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)

                
                Divider()
                
            })
            .padding(.top,25)
            
            Button(action: {
                AppUtils.eraseAllUsrData()
                KeyPro_CSC461App(rootView: .LoginView)
                
            }, label: {
                Text("Logout".uppercased())
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            })//BUTTON
            .padding(15)
            .background(Color.black)
            .cornerRadius(30)
        }
        .padding()
        .background(
            
            HStack{
                Circle()
                    .fill(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                    .frame(width: 120, height: 120)
                    .offset(x: -25,y: 200)
                
                Spacer()
                
                Circle()
                    .fill(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    .frame(width: 90, height: 90)
                    .offset(x: 40,y: 400)
            }
        )
        Spacer()
    }
    
    
}
  

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
    }
}
