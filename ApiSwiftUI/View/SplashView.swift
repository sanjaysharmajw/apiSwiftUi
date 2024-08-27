//
//  SplashView.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 20/07/24.
//

import SwiftUI

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Image(systemName: "camera.macro.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Make the view take up the full screen
        .background(Color.blue) // Set the background color to 
        .edgesIgnoringSafeArea(.all) // Ensure the view covers the entire screen, including safe areas
    }
}

#Preview {
    SplashView()
}
