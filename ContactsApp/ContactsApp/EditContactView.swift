import SwiftUI

struct EditContactView: View {
    @EnvironmentObject var viewModel: ContactsViewModel
    @Environment(\.dismiss) var dismiss

    var contact: Contact

    @State private var name: String
    @State private var phoneNumber: String
    @State private var email: String
    @State private var notes: String
    @State private var isEmergency: Bool
    @State private var isFavorite: Bool

    init(contact: Contact) {
        self.contact = contact
        _name = State(initialValue: contact.name)
        _phoneNumber = State(initialValue: contact.phoneNumber)
        _email = State(initialValue: contact.email ?? "")
        _notes = State(initialValue: contact.notes ?? "")
        _isEmergency = State(initialValue: contact.isEmergency)
        _isFavorite = State(initialValue: contact.isFavorite)
        
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Phone Number", text: $phoneNumber)
                TextField("Email", text: $email)
                TextField("Notes", text: $notes)
                Toggle("Emergency Contact", isOn: $isEmergency)
                Toggle("Favorite Contact", isOn: $isFavorite)
            }
            .navigationTitle("Edit Contact")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.updateContact(
                            contact: contact,
                            name: name,
                            phoneNumber: phoneNumber,
                            email: email,
                            notes: notes,
                            isEmergency: isEmergency,
                            isFavorite: isFavorite)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
