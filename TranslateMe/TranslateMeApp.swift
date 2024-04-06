//
//  TranslateMeApp.swift
//  TranslateMe
//
//  Created by Kyenret Yakubu Ayuba on 4/5/24.
//

import SwiftUI

import FirebaseCore // <-- Import Firebase

@main
struct TranslateMeApp: App {
    var body: some Scene {
        WindowGroup {
            TranslateView()
        }
    }
}
    
//    @State private var authManager: AuthManager // <-- Create a state managed authManager property
//    
//    init() { // <-- Add an init
//        FirebaseApp.configure() // <-- Configure Firebase app
//        authManager = AuthManager() // <-- Initialize the authManager property (needs to be done after FirebaseApp.configure())
//    }
//            if authManager.user != nil { // <-- Check if you have a non-nil user (means there is a logged in user)
//                
//                // We have a logged in user, go to ChatView
//                NavigationStack {
//                    Text("Welcome to TranslateMe!")
//                        .navigationTitle("Translate Me")
//                        .navigationBarTitleDisplayMode(.inline)
//                        .toolbar {
//                            ToolbarItem {
//                                Button("Sign out") {
//                                    authManager.signOut()
//                                }
//                            }
//                        }
//                }
//            } else {
//                // No logged in user, go to LoginView
            //    TranslateView()
//                    //.environment(a)
//            }
//        }
//    }

