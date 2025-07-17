//
//  ContentView.swift
//  protocol
//
//  Created by Mohammad Sabbagh on 11/06/2025.
//

import SwiftUI

struct ContentView: View {
    let pets: [Tameable] = [
        Dog(name: "Dog", ownerName: "sabbagh"),
        Cat(name: "Cat", ownerName: "sabbagh")
    ]

    var body: some View {
        NavigationStack
        {
            List(pets, id: \.Id) {
                pet in HStack {
                    Text(pet.emoji)
                    Text(pet.name)
                    Spacer()
                    Text(pet.ownerName)
                    Button("Play"){
                        pet.play()
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.mini)
                }
            }
            .navigationTitle("Pets")
        }
    }
}

#Preview {
    ContentView()
}

protocol Tameable
{
    var Id: UUID {get}
    var name: String {get set}
    var ownerName: String {get set}
    var emoji: String {get set}
    
    func play()
    func protect()
}

struct Dog: Tameable
{
    var Id = UUID()
    var name: String
    var ownerName: String
    var emoji: String = "🐶"
    func play() {}
    func protect() {}
    func bark() { }
    func eat() { }
}

struct Cat: Tameable
{
    var Id = UUID()
    var name: String
    var ownerName: String
    var emoji: String = "🐱"
    func play() {}
    func protect() {}
    func stalk() { }
    func eat() { }
}

struct Bear
{
    func attack() { }
    func sleep() { }
}

struct Lion
{
    func roar() { }
    func run() { }
}

