//
//  SettingsView.swift
//  MobileGameProject
//
//  Created by Liz Torres on 7/24/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var soundEffects = true
    @State private var notifications = true
    @State private var theme = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Sound Settings")) {
                    Toggle(isOn: $soundEffects) {
                        Text("Sound Effects")
                    }
                }

                Section(header: Text("Notifications")) {
                    Toggle(isOn: $notifications) {
                        Text("Enable Notifications")
                    }
                }
                
                Section(header: Text("Themes")) {
                    Picker("Theme", selection: $theme) {
                        Text("Theme 1").tag(1)
                        Text("Theme 2").tag(2)
                        Text("Theme 3").tag(3)
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
