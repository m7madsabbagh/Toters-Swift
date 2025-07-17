//
//  ContentView.swift
//  ExtractedfunctionsBootcamp
//
//  Created by Mohammad Sabbagh on 12/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State var backgroundColor: Color = Color.pink
    var body: some View {
        ZStack
        {
            //background
            backgroundColor.edgesIgnoringSafeArea(.all)
            //content
            contentLayer
        }
    }
    
    var contentLayer: some View{
        VStack
        {
            Text("title")
                .font(.title)
            Button {
                buttonPressed()
                
            } label: {
                Text("Press me")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }

        }
    }
    
    func buttonPressed()
    {
        backgroundColor = .yellow
    }
}

#Preview {
    ContentView()
}
