//
//  ContentView.swift
//  StateBootcamp
//
//  Created by Mohammad Sabbagh on 12/06/2025.
//state to let the view know whats happening
//tell the view to watch the state of the variable of the  background color because it might change

import SwiftUI



struct ContentView: View {
    @State var backgroundColor: Color = Color.green
    @State var myTitle: String = "My Title"
    @State var Count: Int = 0
    var body: some View {
        ZStack
        {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                Text("Count \(Count)")
                    .font(.headline)
                    .underline()
                
                HStack( spacing: 20)
                {
                    Button("Button 1")
                    {
                        backgroundColor = .red
                        myTitle = "Button 1 was pressed"
                        Count += 1
                    }
                    
                    Button("Button 2")
                    {
                        backgroundColor = .purple
                        myTitle = "Button 2 was pressed"
                        Count -= 1
                    }
                }
                
            }
            .foregroundColor(.white)
        }
        
    }
}

#Preview {
    ContentView()
}
