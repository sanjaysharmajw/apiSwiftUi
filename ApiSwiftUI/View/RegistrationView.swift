
import SwiftUI

struct RegistrationView: View {
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
                    Text("Member Name").font(.subheadline).foregroundColor(.black)
                    CustomTextField(text: $memberName, placeholder: "Member Name")
                    Text("Mobile Number")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    CustomTextField(text: $mobileNumber, placeholder: "Mobile Number")
                    
                    Text("Email")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    CustomTextField(text: $email, placeholder: "Email")
                    
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
            . customNavigationBar(title: "Registration")
            
            
            
        }
        .swipeToDismiss(presentationMode: presentationMode)
        .navigationBarHidden(true)
        .customNavigationBarAppearance()
        
        
    }
 
}


#Preview {
    RegistrationView()
}
