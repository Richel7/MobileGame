//
//  MainView.swift
//  MobileGameProject
//
//  Created by Liz Torres on 7/23/23.
//

import SwiftUI

struct MainView: View {
    @State private var isAuthenticated = false

    var body: some View {
        if isAuthenticated {
            GameContentView(isAuthenticated: $isAuthenticated)
        } else {
            ContentViewer(isAuthenticated: $isAuthenticated)
        }
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
