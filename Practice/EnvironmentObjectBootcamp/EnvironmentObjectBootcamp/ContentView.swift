//
//  ContentView.swift
//  EnvironmentObjectBootcamp
//
//  Created by Mohammad Sabbagh on 17/06/2025.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject
{
    @Published var dataArray: [String] = []
    
    init()
    {
        getData()
    }
    
    func getData()
    {

        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "AppleWatch"])
    }
}

struct EnvironmentObjectBootcamp: View {
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    var body: some View {
        NavigationView {
           
                List
            {
                
                    ForEach(viewModel.dataArray, id: \.self)
                    {item in
                        NavigationLink(destination: DetailedView(viewModel: viewModel, selectedItem: item)) {
                            Text(item)
                        }
                        
                        
                    }
                }
            
                .navigationTitle("iOS Devices")
        }
    }
}

struct DetailedView: View {
    @ObservedObject var viewModel: EnvironmentViewModel
    
    
    let selectedItem: String
    var body: some View {
        ZStack{
            //background
            Color.orange.ignoresSafeArea()
            
            NavigationLink(destination: finalView(viewModel: viewModel)) {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundStyle(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
            }
            
        }
        
    }
}

struct finalView: View {
    
    @ObservedObject var viewModel: EnvironmentViewModel
    var body: some View {
        ZStack
        {
            //background
            
            LinearGradient(gradient: Gradient(colors: [Color(.white), Color(.red)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                            .ignoresSafeArea()
            
            ScrollView
            {
                VStack (spacing: 20)
                {
                    ForEach(viewModel.dataArray, id: \.self){ item in
                        Text(item)
                    }
                }
                .foregroundStyle(.white)
                .font(.largeTitle)
                
            }
        }
}
}

#Preview {
    EnvironmentObjectBootcamp()
    //DetailedView(selectedItem: "iPhone")
    //finalView()
}
