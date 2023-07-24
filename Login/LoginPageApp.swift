//
//  LoginPageApp.swift
//  LoginPage
//
//  Created by user242205 on 7/22/23.
//

import SwiftUI
import FirebaseCore

@main
struct LoginPageApp: App {
    
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            LoginViewer()
        }
    }
}
