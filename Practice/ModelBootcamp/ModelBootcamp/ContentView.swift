//
//  ContentView.swift
//  ModelBootcamp
//
//  Created by Mohammad Sabbagh on 16/06/2025.
//

import SwiftUI

struct UserModel: Identifiable
{
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}

struct ContentView: View {
    @State var users: [UserModel] = [
        //"Nick", "Emily", "Samantha", "Chris"
        UserModel(displayName: "Nick", userName: "Nick123", followerCount: 100, isVerified: true),
        UserModel(displayName: "Emily", userName: "Emily111", followerCount: 55, isVerified: false),
        UserModel(displayName: "Samantha", userName: "Ninja", followerCount: 382, isVerified: false),
        UserModel(displayName: "Chris", userName: "Chrissss", followerCount: 733, isVerified: true)
    ]
    var body: some View {
        NavigationView {
            List{
                ForEach(users)
                {
                    user in
                    HStack(spacing: 15){
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack
                        {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        
                        if user.isVerified
                        {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        
                        VStack{
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 10)
                }
                }
            
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Users")
            
        }
    }
}

#Preview {
    ContentView()
}
