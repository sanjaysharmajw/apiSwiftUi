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
    
    var body: some View {
        VStack(spacing: 20){
            CustomText(text: "Login!").font(.system(size: 40)).padding(.bottom)
            if let loginResponse = viewModel.loginResponse {
                Text("Login successful: \(loginResponse.token)")
                    .padding()
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
                             viewModel.login()
                         }.padding()
                     }
        }.padding(20)
    }
}

#Preview {
    LoginView()
}

