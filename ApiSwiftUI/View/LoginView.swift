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
    @State private var isMainPageActive = false
    @State private var isForgotViewActive = false

    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                CustomText(text: "Login!").font(.system(size: 40)).padding(.bottom)
                if let loginResponse = viewModel.loginResponse {
                    Text("Login successful: \(loginResponse.token)").padding()
                }
                
                CustomTextField(text: $viewModel.email, placeholder: "Email")
                CustomTextField(text: $viewModel.password, placeholder: "Password")
                HStack {
                    Button("Sign up") {
                        isSecondViewActive = true
                    
                    }
                Spacer()
                    Button("Forgot password") {
                        isForgotViewActive = true
                    }}
                    .alert(item: $viewModel.alertItem) { alertItem in
                        Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                    }
                
                if viewModel.isLoading {
                             ProgressView().padding()
                         } else {
                             CustomButton(title: "Login") {
                                 isMainPageActive = true
                                 viewModel.login()
                             }.padding()
                         }
                
            navigate(to: RegistrationView(), when: $isSecondViewActive)
            navigate(to: BottomNavigationView(), when: $isMainPageActive)
            navigate(to: ForgotPasswordView(), when: $isForgotViewActive)
            }.padding(20)
                
                
        }
        
    }

}

#Preview {
    LoginView()
}

