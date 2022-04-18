//
//  ContentView.swift
//  SC
//
//  Created by Qsymond on 27.03.2022.
//

import SwiftUI
import Combine
import OAuth2

struct ContentView: View {
    @State private var login: String = ""
    @State private var showAlert = false
    @EnvironmentObject var researchUser: User
    let intra: IntraApi
    
    func callbackMe(dict: OAuth2JSON?, error: Error?) -> Void {
        if let json = dict {
            if json.isEmpty {
                self.showAlert = true
            } else {
                intra.createUser(json, newUser: self.researchUser)
                self.researchUser.isActive = true
            }
        } else {
            self.showAlert = true
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("logo_42")
                        .resizable()
                        .scaledToFill()
                        .frame(width: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/150.0/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 40)
                    TextField("Login", text: $login)
                        .font(.largeTitle)
                        .frame(width: 300, height: 30)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.black))
                        .padding(.horizontal, 20)
                    
                    Button(action: {
                        self.intra.request(self.login.lowercased(), callback: self.callbackMe(dict:error:))
                    }) {
                        ZStack {
                            Text("Enter")
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                        }
                        .frame(width: 300, height: 30)
                        .padding()
                        .foregroundColor(.white)
                        .cornerRadius(16, antialiased: true)
                    }
                    .padding(.horizontal, 20)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text("The login was entered incorrectly! Try again."), dismissButton: .cancel())
                    }
                    
                    NavigationLink(destination: UserView(), isActive: $researchUser.isActive) {
                        EmptyView()
                    }.navigationBarTitle(Text("Swifty Companion"), displayMode: .automatic)
                    
                }
                .padding()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
