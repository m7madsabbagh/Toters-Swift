import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var themeViewModel: ThemeViewModel

    var body: some View {
        NavigationView {
            Form {
               
                Section(header: Text("Appearance")) {
                    Picker("Theme", selection: $themeViewModel.selectedTheme) {
                        Text("System Default").tag("system")
                        Text("Light").tag("light")
                        Text("Dark").tag("dark")
                    }
                    .pickerStyle(.segmented)
                }

                
                Section(header: Text("About")) {
                    Label("Version 1.0", systemImage: "info.circle")
                    Label("Contact Support", systemImage: "envelope")
                }
            }
            .navigationTitle("Settings")
        }
    }
}
