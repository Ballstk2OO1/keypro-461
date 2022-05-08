//
//  Home.swift
//  Login
//
//  Created by YZR-M1 on 5/5/2565 BE.
//

import SwiftUI

struct Home: View {
    
    @State var showSignUp = false
    
    @State var maxCircleHeight: CGFloat = 0
    
    var body: some View {
        
        VStack{
            
            GeometryReader{proxy -> AnyView in
                
                let height = proxy.frame(in: .global).height
                
                DispatchQueue.main.async {
                    if maxCircleHeight == 0 {
                        maxCircleHeight = height
                    }
                }
                
                return AnyView(
                    
                    ZStack{
                        
                        Circle()
                            .fill(Color(.gray))
                            .offset(x: getRect().width / 2,y: -height / 1.3)
                        
                        
                        Circle()
                            .fill(Color(.gray))
                            .offset(x: -getRect().width / 2,y: -height / 1.5)
                        
                        Circle()
                            .fill(Color(.cyan))
                            .offset(y: -height / 1.3)
                            .rotationEffect(.init(degrees: -5))
                    }
                )
            }
            .frame(maxHeight: getRect().width)
            
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        ZStack{
            
            if showSignUp{
                RegisterPage()
            }
            else{
                Login()
            }
        }
        
        .padding(.top,-maxCircleHeight / 1.6)
        .frame(maxHeight: .infinity, alignment: .top)
        .overlay(
            
            HStack{
                Text(showSignUp ? "Already member?" : "New Member")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                
                Button(action: {
                    withAnimation{
                        showSignUp.toggle()
                    }
                }, label: {
                    Text(showSignUp ? "sign in" : "Create Account")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                })
            }
            ,alignment: .bottom
            
        )
        .background(
            
            HStack{
                Circle()
                    .fill(Color(.cyan))
                    .frame(width: 70, height: 70)
                    .offset(x: -30,y: 0)
                
                Spacer()
                
                Circle()
                    .fill(Color(.black))
                    .frame(width: 90, height: 90)
                    .offset(x: 40,y: 20)
            }
                .offset(y: getSafeArea().bottom)
            
            ,alignment: .bottom
            
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


extension View {
    
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
}
