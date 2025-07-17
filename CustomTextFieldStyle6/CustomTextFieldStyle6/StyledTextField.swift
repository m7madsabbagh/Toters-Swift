import SwiftUI

public struct StyledTextField<Style: TextFieldStyleStrategy>: View {
    @Binding public var text: String
    public var placeholder: String
    public var style: Style
    @FocusState private var isFocused: Bool

    public init(
        text: Binding<String>,
        placeholder: String,
        style: Style
    ) {
        self._text = text
        self.placeholder = placeholder
        self.style = style
    }

    public var body: some View {
        style.makeBody(
            configuration: TextFieldStyleConfiguration(
                text: $text,
                placeholder: placeholder,
                isFocused: $isFocused
            )
        )
    }
}
