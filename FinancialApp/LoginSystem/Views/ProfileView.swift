//
//  ProfileView.swift
//  FinancialApp
//
//  Created by Huỳnh Bình on 25/7/25.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                VStack {
                    if let user = viewModel.user {
                        profile(user: user)
                    } else {
                        Text("Loading profile...")
                    }
                }
                .navigationBarTitle("Profile Page")
            }
            .onAppear {
                viewModel.fetchUser()
            }
        }
    }
    @ViewBuilder
    func profile(user:User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.white)
            .frame(width: 125, height: 125)
            .padding()
        VStack(alignment: .leading) {
            HStack {
                Text("Name:").bold()
                Text(user.name).underline()
            }
            .background(
                RoundedRectangle(cornerRadius: 15).fill(Color.white)
            )
            HStack {
                Text("Email:").bold()
                Text(user.email).underline()
            }
            .background(
                RoundedRectangle(cornerRadius: 15).fill(Color.white)
            )
            HStack {
                Text("Member since:").bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))").underline()
            }
            .background(
                RoundedRectangle(cornerRadius: 15).fill(Color.white)
            )
        }
        .padding()
        Button("LogOut") {
            viewModel.logOut()
        }
        .tint(.white)
        .fontWeight(.semibold)
        .padding()
        .background(Color.red.cornerRadius(15))
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
