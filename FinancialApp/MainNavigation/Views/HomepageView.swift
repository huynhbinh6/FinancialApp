//
//  HomepageView.swift
//  FinancialApp
//
//  Created by Huỳnh Bình on 25/7/25.
//

import SwiftUI

struct HomepageView: View {
    @StateObject var viewModel = HomepageViewModel()
    @StateObject var viewModelProfile = ProfileViewViewModel()
    @State private var showDropdown = false
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    VStack {
                        HStack {
                            VStack {
                                Button {
                                    showDropdown.toggle()
                                } label: {
                                    Image(systemName: "gearshape")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.black)
                                }
                            }
                            if showDropdown {
                                VStack(alignment: .leading) {
                                    Image(systemName: "questionmark.circle")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.black)
                                    Image(systemName: "bell.circle")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.black)
                                }
                                .transition(.slide)
                            }
                            if let userName = viewModelProfile.user?.name {
                                Text("Welcome, \(userName)")
                                    .bold()
                                    .font(.system(size: 18))
                                    
                            } else {
                                Text("Welcome")
                                    .bold()
                                    .font(.system(size: 18))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        Spacer()
                        
                        VStack {
                            Text("Dashboard")
                                .bold()
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(galleries) {
                                        gallery in GalleryView(Im: gallery.Im, title: gallery.title, description: gallery.description, c: gallery.c, destination: gallery.destination)
                                    }
                                }
                            }
                            Text("Articles of your interest")
                                .bold()
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

struct GalleryCards: Identifiable {
    var id = UUID()
    var Im: String
    var title: String
    var description: String
    var c: Color
    var destination: AnyView
}

let galleries: [GalleryCards] = [
    GalleryCards(Im: "FinancialInterestsIm", title: "Financial Interests", description: "Configure your financial feeds", c: .green , destination: AnyView(FinancialInterestsView())),
    GalleryCards(Im: "TrendingIm", title: "Trending Financial News", description: "Explore the trending financial news from around the world!", c: .blue , destination: AnyView(TrendingFinancialNewsView()))
]

struct GalleryView: View {
    var Im: String
    var title: String
    var description: String
    var c: Color
    var destination: AnyView
    var body: some View {
        NavigationLink(destination: destination) {
            RoundedRectangle(cornerRadius: 25)
                .fill(c)
                .frame(width: 270, height: 350)
                .overlay(
                    VStack {
                        Text(title)
                            .bold()
                            .font(.system(size: 24))
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing])
                            .lineLimit(nil)
                        
                        Image(Im)
                            .resizable()
                            .frame(width: 130, height: 150)
                            .padding()
                        
                        Text(description)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding([.leading, .trailing])
                            .bold()
                    }
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    HomepageView()
}
