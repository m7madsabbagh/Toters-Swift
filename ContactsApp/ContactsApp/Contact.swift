//
//  Contact.swift
//  ContactsApp
//
//  Created by Mohammad Sabbagh on 17/06/2025.
//
//Defines what a contact is: name, phone, email, notes
//Makes contacts identifiable
//Every contact in the app follows this structure

//ContactsViewModel to store and manage data
//ContactsPage to list and display contacts
//ContactDetailView to show the details

import Foundation

struct Contact: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var phoneNumber: String
    var email: String?
    var notes: String?
    var isEmergency: Bool = false
    var isFavorite: Bool = false
    var isPinned: Bool = false

    init(id: UUID = UUID(), name: String, phoneNumber: String, email: String? = nil, notes: String? = nil, isEmergency: Bool, isFavorite: Bool, isPinned: Bool) {
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.notes = notes
        self.isEmergency = isEmergency
        self.isFavorite = isFavorite
        self.isPinned = isPinned
    }
}
