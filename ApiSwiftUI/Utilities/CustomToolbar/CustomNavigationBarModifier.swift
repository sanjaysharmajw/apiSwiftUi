import SwiftUI

struct CustomNavigationBarModifier: ViewModifier {
    var toolBarTitle: String
    @Environment(\.presentationMode) var presentationMode

    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(toolBarTitle)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
            })
            .background(Color.white.edgesIgnoringSafeArea(.top))
    }
}

extension View {
    func customNavigationBar(title: String) -> some View {
        self.modifier(CustomNavigationBarModifier(toolBarTitle: title))
    }
}
