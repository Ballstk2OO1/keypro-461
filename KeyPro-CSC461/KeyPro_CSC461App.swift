//
//  KeyPro_CSC461App.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 4/5/2565 BE.
//

import SwiftUI

@main
struct KeyPro_CSC461App: App {
    @ObservedObject var rootView = RootView.shared
    
    init(rootView: AppViews) {
        self.rootView.viewId = rootView
    }
    
    init() {
        if AppUtils.getUsrAuthToken() == nil {
            self.rootView.viewId = .LoginView
        } else {
            self.rootView.viewId = .MainAppView
        }
    }
        
    var body: some Scene {
        WindowGroup {
            if rootView.viewId == .LoginView {
                // Login
                NavigationBar()
//                ContentView()
            } else {
                ContentView()                    
            }
        }
    }
}
