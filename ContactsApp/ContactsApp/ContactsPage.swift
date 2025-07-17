//
//  ContactsPage.swift
//  ContactsApp
//
//  Created by Mohammad Sabbagh on 17/06/2025.
//

import SwiftUI

struct ContactsPage: View {
    @EnvironmentObject var viewModel: ContactsViewModel
    @State private var showAddContact = false
   

    var body: some View {
        NavigationView {
            List {
                //gets contacts from the viewModel
                ForEach(viewModel.filteredContacts.sorted { $0.isPinned && !$1.isPinned }) { contact in
                    NavigationLink(destination: ContactDetailView(contact: contact)) {
                        VStack(alignment: .leading) {
                            HStack {
                                if contact.isPinned {
                                    Image(systemName: "pin.fill")
                                        .foregroundColor(.blue)
                                }

                                Text(contact.name)
                                    .font(.headline)

                                if contact.isEmergency {
                                    Spacer()
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .foregroundColor(.red)
                                }
                            }

                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            viewModel.pinContact(contact)
                        } label: {
                            Label(contact.isPinned ? "Unpin" : "Pin",
                                  systemImage: contact.isPinned ? "pin.slash.fill" : "pin.fill")
                        }
                        .tint(.blue)
                    }
                }
                .onDelete(perform: deleteContact)
            }

            .searchable(text: $viewModel.searchText)
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddContact = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddContact) {
                AddContactView()
            }
        }
    }

    func deleteContact(at offsets: IndexSet) {
        viewModel.contacts.remove(atOffsets: offsets)
    }
}

#Preview {
    ContactsPage()
        .environmentObject(ContactsViewModel())
}
