//
//  ContactsViewModel.swift
//  ContactsApp
//
//  Created by Mohammad Sabbagh on 17/06/2025.
//
//this is the apps central manager. manages all the logic

import Foundation

class ContactsViewModel: ObservableObject {
    @Published var contacts: [Contact] = [] //triggers ui updates when changes
    @Published var searchText: String = "" //used for searchable() filtering

    private let storageKey = "savedContacts"

    init() {
        loadContacts()

        if contacts.isEmpty {
            contacts.append(Contact(
                name: "Mohammed Sabbagh",
                phoneNumber: "+961 81864203",
                email: "mohammed_sabbagh01@outlook.com",
                notes: "Close contact — default added",
                isEmergency: true,
                isFavorite: true,
                isPinned: true
            ))
            saveContacts()
        }
    }

    var filteredContacts: [Contact] {
        searchText.isEmpty ? contacts : contacts.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    //hayde l function to add a new contact 
    func addContact(name: String, phoneNumber: String, email: String?, notes: String?, isEmergency: Bool, isFavorite: Bool, isPinned: Bool) {
        let newContact = Contact(
            name: name,
            phoneNumber: phoneNumber,
            email: email,
            notes: notes,
            isEmergency: isEmergency,
            isFavorite: isFavorite,
            isPinned: isPinned) //passed here (stored)
        contacts.append(newContact)
        saveContacts()
    }
    
    
    
    func updateContact(contact: Contact, name: String, phoneNumber: String, email: String?, notes: String?, isEmergency: Bool, isFavorite: Bool) {
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
            contacts[index].name = name
            contacts[index].phoneNumber = phoneNumber
            contacts[index].email = email
            contacts[index].notes = notes
            contacts[index].isEmergency = isEmergency
            contacts[index].isFavorite = isFavorite 
            saveContacts()
        }
    }
    
    func pinContact(_ contact:Contact){
        if let index = contacts.firstIndex(where: { $0.id == contact.id }) {
                contacts[index].isPinned.toggle() // Toggle pin/unpin
                saveContacts()
            }
    }


    private func saveContacts() {
        if let data = try? JSONEncoder().encode(contacts) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }

    private func loadContacts() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let saved = try? JSONDecoder().decode([Contact].self, from: data) {
            self.contacts = saved
        }
    }
}

