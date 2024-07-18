//
//  LoginView.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 17/07/24.
//

import Foundation

import SwiftUI

struct LoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var isSecondViewActive = false

    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                CustomText(text: "Login!").font(.system(size: 40)).padding(.bottom)
                if let loginResponse = viewModel.loginResponse {
                
                    Text("Login successful: \(loginResponse.token)").padding()
                    NavigationLink(destination: RegistrationView(), isActive: $isSecondViewActive) {
                                      EmptyView()
                                  }
                }
                
                CustomTextField(text: $viewModel.email, placeholder: "Email")
                CustomTextField(text: $viewModel.password, placeholder: "Password")
                HStack {
                    Spacer()
                    Button("Forgot password") {
                        viewModel.login()
                    }
                    
                    }
                    .alert(item: $viewModel.alertItem) { alertItem in
                        Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                    }
                
                if viewModel.isLoading {
                             ProgressView().padding()
                         } else {
                             CustomButton(title: "Login") {
                                 isSecondViewActive = true
                                 viewModel.login()
                             }.padding()
                         }
            }.padding(20)
        }
        
    }

      
}

#Preview {
    LoginView()
}

