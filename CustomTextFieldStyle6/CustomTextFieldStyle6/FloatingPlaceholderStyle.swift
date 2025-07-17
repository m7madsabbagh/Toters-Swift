import SwiftUI
public struct FloatingPlaceholderStyle: TextFieldStyleStrategy {
    @ViewBuilder
    public func makeBody(configuration: TextFieldStyleConfiguration) -> some View {
        let shouldFloat = configuration.isFocused.wrappedValue
                       || !configuration.text.wrappedValue.isEmpty

        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                .background(Color.white.cornerRadius(8))

            Text(configuration.placeholder)
                .foregroundColor(.gray)
                .font(shouldFloat ? .caption : .body)
                .background(Color.white)
                .offset(x: 12, y: shouldFloat ? -12 : 0)
                .animation(.easeInOut(duration: 0.2), value: shouldFloat)

            
            TextField("", text: configuration.text)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .focused(configuration.isFocused)
        }
        .frame(height: 44)
    }
}
