//
//  appViews.swift
//  KeyPro-CSC461
//
//  Created by Thiti Watcharasottikul on 5/5/2565 BE.
//

import Foundation

enum AppViews {
    case LoginView
    case MainAppView
}


class RootView: ObservableObject {
    
    static let shared = RootView(showingView: .LoginView)
    
    init(showingView: AppViews) {
        self.viewId = showingView
    }
    
    @Published var viewId : AppViews
}
