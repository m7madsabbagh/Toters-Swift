//
//  ContentView.swift
//  ViewModelBootcamp
//
//  Created by Mohammad Sabbagh on 16/06/2025.
//

import SwiftUI

struct FruitModelBootcamp: Identifiable
{
    let id: String = UUID().uuidString
    let name: String
    let count: Int
    
}

class FruitViewModel: ObservableObject
{
   @Published var fruitArray: [FruitModelBootcamp] = []
    @Published var isLoading: Bool = false
    
    init()
    {
        getFruits()
    }
    
    func getFruits()
    {
        let fruit1 = FruitModelBootcamp(name: "Orange", count: 1)
        let fruit2 = FruitModelBootcamp(name: "Banana", count: 2)
        let fruit3 = FruitModelBootcamp(name: "Watermelon", count: 88)
      
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0)
        { [self] in
            fruitArray.append(fruit1)
            fruitArray.append(fruit2)
            fruitArray.append(fruit3)
            isLoading = false
        }
    }
    func deleteFruit(index: IndexSet)
    {
        fruitArray.remove(atOffsets: index)
    }
}
struct ContentView: View {
    
    //@StateObject use this on creation
    //ObservedObject use this for subviews
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView{
            List{
                
                if fruitViewModel.isLoading
                {
                    ProgressView()
                }
                else
                {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack{
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .navigationBarItems(trailing: NavigationLink(destination: RandomScreen(fruitViewModel: fruitViewModel), label: {
                Image(systemName: "arrow.right")
                            .font(.title)
            })
                                )
                                    
            
        }
        
    }
    
}

struct RandomScreen: View {
    
    @Environment(\.presentationMode) var  presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    var body: some View {
        
            ZStack
            {
                Color.green.ignoresSafeArea(.all)
                
                VStack
                {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        Text(fruit.name)
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
            }
            
        }
    }


#Preview {
    ContentView()
    //RadnomScreen()
}

class ParentViewModel: ObservableObject {
    @Published var count = 0
}

struct ParentView: View {
    @StateObject var viewModel = ParentViewModel()
    
    var body: some View {
        Button {
            viewModel.count += 1
        } label: {
            Text("\(viewModel.count)")
        }
    }
}

struct childView: View {
    @ObservedObject var viewModel: ParentViewModel
    
    init(viewModel: ParentViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text("")
    }
}

struct CounterView: View {
    @State var count = 0
    
    var body: some View {
        CounterButton(count: $count)
        Text("Count is \(count)")
    }
}

struct CounterButton: View {
    @Binding var count: Int
    
    var body: some View {
        Button {
            count += 1
        } label: {
            Text("\(count)")
        }
    }
}


#Preview {
    CounterView()
    //RadnomScreen()
}

