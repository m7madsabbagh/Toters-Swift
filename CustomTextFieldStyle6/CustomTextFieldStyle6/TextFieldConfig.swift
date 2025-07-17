import SwiftUI

public struct TextFieldStyleConfiguration {
    public var text: Binding<String>
    public var placeholder: String
    public var isFocused: FocusState<Bool>.Binding

    public init(
        text: Binding<String>,
        placeholder: String,
        isFocused: FocusState<Bool>.Binding
    ) {
        self.text = text
        self.placeholder = placeholder
        self.isFocused = isFocused
    }
}
