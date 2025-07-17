//
//  ContentView.swift
//  ProgressViewStyle
//
//  Created by Mohammad Sabbagh on 23/06/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 0.5

    var body: some View {
        VStack(spacing: 20) {
            Text("Loading: \(Int(progress * 100))%")

            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()

            Button("Increase") {
                if progress < 1.0 {
                    progress += 0.01
                }
            }

            Button("Reset") {
                progress = 0.0
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
