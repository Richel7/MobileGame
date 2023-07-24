//
//  MobileGameProjectApp.swift
//  MobileGameProject
//
//  Created by Liz Torres on 7/23/23.
//

import SwiftUI
import Firebase

@main
struct MobileGameProjectApp: App {
    init() {
            FirebaseApp.configure()
        }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
