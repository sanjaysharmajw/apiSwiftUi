

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        TextField(placeholder, text: $text)
                    .frame(height: 50)
                    .padding([.leading], 20)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 2))
                    .tint(.red)
    }
}

