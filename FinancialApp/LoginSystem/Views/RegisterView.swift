//
//  RegisterView.swift
//  FinancialApp
//
//  Created by Huỳnh Bình on 25/7/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    @State private var errorMessageID = UUID()
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .foregroundColor(.green)
                        .rotationEffect(Angle(degrees: -15), anchor: .center)
                    VStack {
                        Text("Register")
                            .foregroundColor(.white)
                            .font(.system(size: 35))
                            .bold()
                        Text("Create your account")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 3, height: 300)
                .offset(y: -100)
                .padding(.bottom, 50)

                Form {
                    TextField("Fullname", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Button {
                        viewModel.register()
                        errorMessageID = UUID()
                    } label: {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.green)
                            .frame(width: 150, height: 80)
                            .overlay(
                                Text("Register")
                                    .foregroundColor(.white)
                                    .bold()
                            )
                    }
                    .padding()
                }
                .offset(y: -50)
                Spacer()
                VStack {
                    Text("Already have an account?")
                    NavigationLink(
                        "Log into your account",
                        destination: LoginView()
                    )
                }
                Spacer()

                if let errorMessage = viewModel.errorMessage,
                    errorMessageID == UUID()
                {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.vertical, 10)
                        .id(errorMessageID)
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
