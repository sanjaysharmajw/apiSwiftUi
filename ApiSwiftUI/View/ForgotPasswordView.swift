//
//  ForgotPasswordView.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 27/08/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var memberName: String = ""
    @State private var mobileNumber: String = ""
    @State private var email: String = ""
    @State private var loginToken: String = ""
    @Environment(\.presentationMode) var presentationMode
    @GestureState private var dragOffset = CGSize.zero
    @State private var isActive = false
    
    var body: some View {
        NavigationStack {
            VStack{
                VStack(alignment:.leading,spacing: 16) {
                    Text(loginToken)
                        .font(.subheadline)
                        .foregroundColor(.black)
                    Text("Email").font(.subheadline).foregroundColor(.black)
                    CustomTextField(text: $memberName, placeholder: "Enter Email")
                    Text("Mobile Number")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    CustomTextField(text: $mobileNumber, placeholder: "Mobile Number")
                    
                    CustomButton(title: "Submit") {
                        isActive=true
                        
                    }.padding(.top,50)
                    Spacer()
                }
                
                .navigationBarBackButtonHidden(true)
                .padding(.horizontal, 24)
                NavigationLink(destination: BottomNavigationView(), isActive: $isActive) {
                    EmptyView()
                }
                
            }
            . customNavigationBar(title: "Forgot")
            
            
            
        }
//        .navigationTitle("Forgot")
//        .navigationBarTitleDisplayMode(.inline)
//        .background()
        .swipeToDismiss(presentationMode: presentationMode)
        .navigationBarHidden(true)
        .customNavigationBarAppearance()
    }
 
}


#Preview {
    ForgotPasswordView()
}

