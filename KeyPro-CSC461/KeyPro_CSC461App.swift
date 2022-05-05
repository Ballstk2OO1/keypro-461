//
//  KeyPro_CSC461App.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 4/5/2565 BE.
//

import SwiftUI

@main
struct KeyPro_CSC461App: App {
    var rootView: String = "login"
    init() {
        if AppUtils.getUsrAuthToken() == nil {
            rootView = "login"
        } else {
            rootView = "main"
        }
    }
    var body: some Scene {
        WindowGroup {
            if rootView == "login" {
                // Login
                ContentView()
            } else {
                ContentView()
            }
        }
    }
}
