//
//  ContentView.swift
//  FinancialApp
//
//  Created by Huỳnh Bình on 25/7/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    var body: some View {
        ZStack {
            if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
                TabView{
                    HomepageView()
                        .tabItem{
                            Label("Home", systemImage: "house")
                        }
                    ProfileView()
                        .tabItem{
                            Label("Profile", systemImage: "person.circle")
                        }
                }
            }
            else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
