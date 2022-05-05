//
//  TabBar.swift
//  Login
//
//  Created by YZR-M1 on 5/5/2565 BE.
//

import SwiftUI

struct TabBar: View {
        
    var body: some View {
       
        HStack(){
                    
                    Button(action: {
                        //KKeyPro_CSC461App: .Product)
                    }){
                        VStack{
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.purple)
                            Text("Product")
                                .foregroundColor(Color.purple)
                        }
                        .frame(width: UIScreen.main.bounds.width/3.5)
                    }
            
                
            
                    Button(action: {
                        //KeyPro_CSC461App(rootView: .Product)
                    }){
                        VStack{
                            Image(systemName: "bag.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.purple)
                            Text("My Order")
                                .foregroundColor(Color.purple)
                        }
                        .frame(width: UIScreen.main.bounds.width/3.5)
                    }

                    Button(action: {
                        //KeyPro_CSC461App(rootView: .Product)
                    }){
                        VStack{
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.purple)
                            Text("Account")
                                .foregroundColor(Color.purple)
                        }
                         .frame(width: UIScreen.main.bounds.width/3.5)
                    }
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .center)
        
                .padding(.top, 12)
                .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 15)
                .background(Color.white.opacity(0.5))
    
    
        }
    
}




struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
