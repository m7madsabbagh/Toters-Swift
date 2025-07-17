import SwiftUI


struct PillButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .foregroundColor(.white)
            .font(.headline)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Custom Button Style Demo")
                .font(.title2)
                .bold()

            Button("Tap Me") {
                print("Button tapped!")
            }
            .buttonStyle(PillButtonStyle())

            Button(action: {
                print("Settings tapped")
            }) {
                Label("Settings", systemImage: "gear")
            }
            .buttonStyle(PillButtonStyle())
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
