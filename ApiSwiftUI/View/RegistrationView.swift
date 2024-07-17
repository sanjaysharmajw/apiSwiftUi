import SwiftUI

struct RegistrationView: View {
    @State private var memberName: String = ""
    @State private var mobileNumber: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RegistrationView()
}
