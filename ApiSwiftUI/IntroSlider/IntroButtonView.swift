//
//  IntroButtonView.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 25/07/24.
//

import SwiftUI

struct IntroButtonView: View {
    
    @Binding var currentPage: Int
    let action:()->Void

    var body: some View {
        
        NavigationStack{
            HStack {
              
                Button(action: action) {
                    Text("Skip")
                        .padding()
                        .foregroundColor(.gray)
                }
            
                Spacer()
                
                Button(action: {
                    // Handle Next action
                    if currentPage < 2 {
                        currentPage += 1
                    } else {
                        // Navigate to the main app screen
                        
                    }
                }) {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 4)
                            .opacity(0.2)
                            .foregroundColor(.red)
                        
                        Circle()
                            .trim(from: 0.0, to: CGFloat(currentPage + 1) / 3)
                            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                            .foregroundColor(.red)
                            .rotationEffect(Angle(degrees: 270.0))
                            .animation(.linear, value: currentPage)
                    
                        Image(systemName: "arrow.right.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.red)
                        
                        
                    }
                    .frame(width: 60, height: 60)
                    
                }
            }
            .padding(.bottom,40)
            .padding(.horizontal,20)
        }
    }
}


struct ButtonsView_Previews: PreviewProvider {
    @State static var currentPage = 0
    static var previews: some View {
        IntroButtonView(currentPage: $currentPage) {
            Text("ssss")
        }
    }
}
