
import SwiftUI

struct CustomText: View {
    @State var text: String = ""
    var action: () -> Void = {}
    var body: some View {
        Text(text).onTapGesture(perform: {
            action()
        })
    }
}

#Preview {
    CustomText()
}
