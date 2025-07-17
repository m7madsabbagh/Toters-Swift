import SwiftUI

struct ContactsTabView: View {
    
    var body: some View {
        TabView {
            
            ContactsPage()
            .tabItem {  
                Image(systemName: "person.2.fill")
                Text("Contacts")
            }

            FavoritesPage()//to render its view
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }

            Text("Calls")
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("Calls")
                }

            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}


