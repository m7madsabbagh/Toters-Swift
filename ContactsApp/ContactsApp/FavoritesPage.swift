import SwiftUI

struct FavoritesPage: View {
    @EnvironmentObject var viewModel: ContactsViewModel

    var body: some View {
        NavigationView {
            let favorites = viewModel.contacts.filter { $0.isFavorite }

            VStack {
                List {
                    if favorites.isEmpty {
                        Text("No favorite contacts yet.")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(favorites) { contact in
                            NavigationLink(destination: ContactDetailView(contact: contact)) {
                                HStack {
                                    Text(contact.name)
                                    Spacer()
                                    if contact.isEmergency {
                                        Image(systemName: "exclamationmark.triangle.fill")
                                            .foregroundColor(.red)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}



