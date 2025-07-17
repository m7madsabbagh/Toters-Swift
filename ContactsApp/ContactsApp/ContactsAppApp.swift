import SwiftUI

@main
struct ContactsAppApp: App {
    @StateObject private var contactsViewModel = ContactsViewModel()
    @StateObject private var themeViewModel = ThemeViewModel()

    var body: some Scene {
        WindowGroup {
            ContactsTabView()
                .environmentObject(contactsViewModel)
                .environmentObject(themeViewModel)
                .preferredColorScheme(themeViewModel.currentColorScheme)
        }
    }
}
