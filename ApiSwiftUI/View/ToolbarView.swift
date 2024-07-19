import SwiftUI

struct CustomToolbarView: View {
    var title: String
    var body: some View {
        HStack {
            Button(action: {
                // Action to go back
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
            }
            Spacer()
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
            // Optional: Add another button here if needed
            Spacer().frame(width: 44) // To balance the HStack
        }
        .padding()
        .background(Color.blue)
    }
}

struct ContentView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                Text("Content goes here")
                Spacer()
            }
            .navigationBarHidden(true)
            .overlay(
                VStack {
                    CustomToolbarView(title: "Title")
                    Spacer()
                }
            )
            .gesture(DragGesture().onEnded { value in
                if value.translation.width > 50 {
                    // Handle the back gesture manually
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

