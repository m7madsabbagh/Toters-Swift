import SwiftUI

public struct DefaultPlaceholderStyle: TextFieldStyleStrategy {
    @ViewBuilder
    public func makeBody(configuration: TextFieldStyleConfiguration) -> some View {
        TextField(configuration.placeholder, text: configuration.text)
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .focused(configuration.isFocused)
            .frame(height: 44)
    }
}
