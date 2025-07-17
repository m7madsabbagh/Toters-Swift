import SwiftUI

struct ContentView: View {
    @State private var firstText  = ""
    @State private var secondText = ""

    var body: some View {
        VStack(spacing: 16) {
            StyledTextField(
                text: $firstText,
                placeholder: "Type your message...",
                style: FloatingPlaceholderStyle()
            )

            StyledTextField(
                text: $secondText,
                placeholder: "Type your message...",
                style: DefaultPlaceholderStyle()
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
