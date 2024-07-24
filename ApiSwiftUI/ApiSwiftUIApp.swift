//
//  ApiSwiftUIApp.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 17/07/24.
//

import SwiftUI

@main
struct ApiSwiftUIApp: App {
    @State private var isActive = false
    var body: some Scene {
        WindowGroup {
            VStack {
                if isActive {
                    LoginView() // Your main content view
                } else {
                    SplashView()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
            
        }
    }

