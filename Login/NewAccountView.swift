//
//  NewAccountView.swift
//  LoginPage
//
//  Created by user242205 on 7/22/23.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct NewAccountView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    
    
    var body: some View {
        ZStack{
            Image("sky").resizable().edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Text("New Account")
                    .font(.largeTitle)
                
                Spacer()
                
                HStack{
                    Image(systemName: "username")
                        .foregroundColor(.gray)
                    TextField("Username", text:$username)
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.bold)
                    if(username.count != 0){
                        Image(systemName: username.isValidUsername() ? "checkmark" : "xmark")
                            .frame(width:30)
                            .fontWeight(.bold)
                            .foregroundColor(username.isValidUsername() ? .green : .red)
                    }
                }.padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.black)
                    ).padding()
                HStack{
                    Image(systemName: "lock")
                        .foregroundColor(.black)
                    TextField("Password", text:$password)
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.bold)
                }.padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                    ).padding()
                HStack{
                    Spacer()
                    
                    Button(action:{
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Cancel").foregroundColor(.black).font(.title)
                    }
                    Spacer()
                    
                    
                    Button(action: {
                        // Create a new user account with Firebase Authentication
                        Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
                            if let error = error {
                                // Handle error during user creation
                                print("Error creating user: \(error.localizedDescription)")
                            }
                            if let authResult = authResult{
                                print("\(authResult.user.uid)")
                            }
                            presentationMode.wrappedValue.dismiss()
                        }
                    }) {
                        Text("Create Account").foregroundColor(.black).font(.title)
                    }
                    
                    Spacer()
                    
                }
                Spacer()
            }
        }
    }
}


struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
