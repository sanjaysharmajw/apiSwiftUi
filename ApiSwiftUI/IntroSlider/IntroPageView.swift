//
//  IntroPageView.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 25/07/24.
//

import SwiftUI

struct IntroPageView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.red)
            
            Spacer()
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
        }
        .cornerRadius(20)
        .padding()
    }
}

#Preview {
    IntroPageView(imageName: "dollar.circle.fill", title: "Welcome to Dsurf.", description: "Get monthly money tips and stay on top of your finance")
        .tag(0)
}
