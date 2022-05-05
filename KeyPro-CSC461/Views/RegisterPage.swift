//
//  RegisterPage.swift
//  Login
//
//  Created by YZR-M1 on 5/5/2565 BE.
//

import SwiftUI

struct RegisterPage: View {
    
    @State var firstname = ""
    @State var lastname = ""
    @State var email = ""
    @State var username = ""
    @State var password = ""
    
    @State var onSubmit: Bool = false
    @State var errMsg: String = "error"
    @State var isLoading: Bool = false
    @State var isError: Bool = false
    @State var isNoNetwork: Bool = false
    
    func register() {
        var model = requestRegisterModel()
        model.name?.firstname = firstname
        model.name?.lastname = lastname
        model.email = email
        model.username = username
        model.password = password
        
        AuthViewModel().register(reqObject: model) { result in
            isLoading.toggle()
            switch result {
            case .success(let response):
                print("Success",response)
                AppUtils.saveUsrEmail(email: response.email ?? "")
                onSubmit.toggle()
                
            case .failure(let error):
                switch error{
                case .BackEndError(let msg):
                    errMsg = msg
                    isError = true
                case .Non200StatusCodeError(let val):
                    print("Error Code: \(val.status) - \(val.message)")
                case .UnParsableError:
                    print("Error \(error)")
                case .NoNetworkError:
                    isNoNetwork.toggle()
                }
            }
        }
    }
    
    var body: some View {
        VStack{
            
            Text("Register")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
                .kerning(1.9)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            //Username, Password
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Firstname")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("Firstname", text:$firstname )
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.top,5)
                
                Divider()
                
            })
            .padding(.top,25)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Lastname")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("Lastname", text:$lastname )
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.top,5)
                
                Divider()
                
            })
            .padding(.top,25)
            
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
                Text("Email")
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("email@email.com", text:$email )
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
                
                TextField("Password", text:$password )
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.top,5)
                
                Divider()
                
                //Register
                Button(action: register, label: {
                    Text("Create Account")
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
    
    struct RegisterPage_Previews: PreviewProvider {
        static var previews: some View {
            RegisterPage()
        }
    }
    
}
