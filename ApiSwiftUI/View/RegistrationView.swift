import SwiftUI

struct RegistrationView: View {
    @State private var memberName: String = ""
    @State private var mobileNumber: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack {
                // Header
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("Registration")
                        .font(.headline)
                        .foregroundColor(.white)
                       
                    Spacer()
                }
                .padding()
                .background(Color.blue)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Member Name")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    TextField("Member Name", text: $memberName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Text("Mobile Number")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    TextField("Mobile Number", text: $mobileNumber)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
                
                Spacer()
                
                CustomButton(title: "Submit") {
                    
                }.padding(.horizontal,24)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
