//
//  Login.swift
//  Login
//
//  Created by YZR-M1 on 5/5/2565 BE.
//

import SwiftUI

struct Login: View {
    
    @State var username = ""
    @State var password = ""
    
    func login() {
        var model = requestLoginModel()
        model.username = username
        model.password = password
        
        AuthViewModel().login(reqObject: model) { result in
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.saveUsrEmail(email: response.email ?? "")
                AppUtils.saveUsrUsername(username: response.username ?? "")
                AppUtils.saveUsrName(firstname: response.name?.firstname ?? "", lastname: response.name?.lastname ?? "")
                
                KeyPro_CSC461App(rootView: .MainAppView)
                
            case .failure(let error):
                switch error{
                case .BackEndError(let msg):
                    print("Error: \(msg)")
                case .Non200StatusCodeError(let val):
                    print("Error Code: \(val.status) - \(val.message)")
                case .UnParsableError:
                    print("Error \(error)")
                case .NoNetworkError:
                    print("No Network Error")
                }
            }
        }
    }
    
    var body: some View {
        VStack{
            
            Text("Login")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
                .kerning(1.9)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            //Username, Password
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Username")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("Username", text:$username )
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.top,5)
                
                Divider()
                
            })
            .padding(.top,25)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Password")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                SecureField("Password", text:$password )
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.top,5)
                
                Divider()
                
                //Login
                Button(action: login, label: {
                    Text("Login")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                })
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                
            })
            .padding(.top,25)
            
            
            
            
            
        }
        .padding()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
