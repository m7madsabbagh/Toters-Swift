import SwiftUI

struct AddContactView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: ContactsViewModel

    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var notes: String = ""
    @State private var isEmergency: Bool = false
    @State private var isFavorite: Bool = false
    @State private var isPinned: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Contact Info")) {
                    TextField("Name", text: $name)
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                }

                Section(header: Text("Notes")) {
                    TextField("Notes", text: $notes)
                }

                Section {
                    Toggle("Mark as Emergency Contact", isOn: $isEmergency)
                }
                
                Section{
                    Toggle("Favorite contact", isOn: $isFavorite)
                }

                Section {
                    Button("Save") {
                        viewModel.addContact(
                            name: name,
                            phoneNumber: phoneNumber,
                            email: email.isEmpty ? nil : email,
                            notes: notes.isEmpty ? nil : notes,
                            isEmergency: isEmergency,
                            isFavorite: isFavorite,
                            isPinned: isPinned //where they are being passed
                        )
                        dismiss()
                    }
                    .disabled(name.isEmpty || phoneNumber.isEmpty)
                }
            }
            .navigationTitle("Add Contact")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddContactView()
        .environmentObject(ContactsViewModel())
}
