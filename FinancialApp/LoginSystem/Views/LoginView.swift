//
//  LoginView.swift
//  FinancialApp
//
//  Created by Huỳnh Bình on 25/7/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack {
                HeaderView()
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address: ", text: $viewModel.email).textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password: ", text: $viewModel.password).textFieldStyle(RoundedBorderTextFieldStyle())
                    Button {
                        viewModel.login()
                    } label: {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.green)
                            .frame(width: 150, height: 80)
                            .overlay(
                                Text("Login")
                                    .foregroundColor(.white)
                                    .bold()
                            )
                    }
                    .padding()
                }
                VStack {
                    Text("Do you need to make an account?")
                    NavigationLink("Create Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
