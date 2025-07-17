import SwiftUI

public protocol TextFieldStyleStrategy {
    associatedtype Body: View

    @ViewBuilder
    func makeBody(configuration: TextFieldStyleConfiguration) -> Body
}
