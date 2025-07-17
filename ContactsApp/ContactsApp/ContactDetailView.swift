import SwiftUI

struct ContactDetailView: View {
    @EnvironmentObject var viewModel: ContactsViewModel
    var contact: Contact
    @State private var showEditView = false

    var body: some View {
        Form {
            Section {
                Text(contact.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.vertical, 8)
            }

            if !contact.phoneNumber.isEmpty {
                Section(header: Text("Phone")) {
                    Label(contact.phoneNumber, systemImage: "phone")
                }
            }

            if let email = contact.email, !email.isEmpty {
                Section(header: Text("Email")) {
                    Label(email, systemImage: "envelope")
                }
            }

            if let notes = contact.notes, !notes.isEmpty {
                Section(header: Text("Notes")) {
                    Text(notes)
                }
            }

            if contact.isEmergency {
                Section {
                    Label("Emergency Contact", systemImage: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                }
            }
            
            if contact.isFavorite{
                Section {
                    Label("Favorite Contact", systemImage: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }
        .navigationTitle("Contact Details")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Edit") {
                    showEditView = true
                }
            }
        }
        .sheet(isPresented: $showEditView) {
            EditContactView(contact: contact)
                .environmentObject(viewModel)
        }
    }
}
