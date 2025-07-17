//
//  ContentView.swift
//  ExtractSubviews
//
//  Created by Mohammad Sabbagh on 12/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State var backgroundColor: Color = Color.blue
    var body: some View {
        ZStack{
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            //content
            myItem
            }
        
    }
    var myItem: some View
    {
        VStack{
            Text("1")
            Text("Apples")
            
        }
        .padding()
        .background(Color.red)
        . cornerRadius(10)
    }
}

#Preview {
    ContentView()
}
