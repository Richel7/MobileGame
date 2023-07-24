//
//  GameContentView.swift
//  MobileGameProject
//
//  Created by Liz Torres on 7/24/23.
//

import SwiftUI
import FirebaseAuth

struct GameContentView: View {
    @Binding var isAuthenticated: Bool

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: TicTacToeContentView()) {
                    Text("Tic Tac Toe")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: RPSContentView()) {
                    Text("Rock, Paper, Scissors")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()

                Button(action: {
                    do {
                        try Auth.auth().signOut()
                        self.isAuthenticated = false
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }
                }) {
                    Text("Log Out")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding()
            .navigationBarTitle("Game Menu", displayMode: .inline)
        }
    }
}

struct GameContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameContentView(isAuthenticated: .constant(true))
    }
}
