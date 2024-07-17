//
//  CustomButton.swift
//  SwiftUI-MVVM
//
//  Created by Sanjay Sharma on 16/07/24.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let action:()->Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.blue)
                .cornerRadius(5)
        }
    }
}

#Preview {
    CustomButton(title: "Action", action: {})
}
