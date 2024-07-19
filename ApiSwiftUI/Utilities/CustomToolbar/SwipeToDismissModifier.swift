import SwiftUI

struct SwipeToDismissModifier: ViewModifier {
    @Binding var presentationMode: PresentationMode
    @GestureState private var dragOffset = CGSize.zero

    func body(content: Content) -> some View {
        content
            .offset(x: dragOffset.width)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        state = value.translation
                    }
                    .onEnded { value in
                        if value.translation.width > 50 {
                            self.presentationMode.dismiss()
                        }
                    }
            )
    }
}

extension View {
    func swipeToDismiss(presentationMode: Binding<PresentationMode>) -> some View {
        self.modifier(SwipeToDismissModifier(presentationMode: presentationMode))
    }
}

