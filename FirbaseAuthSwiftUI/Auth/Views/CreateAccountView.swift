//
//  CreateAccountView.swift
//  FirbaseAuthSwiftUI
//
//  Created by Rahul Acharya on 15/11/24.
//

import SwiftUI

struct CreateAccountView: View {
    
    @State private var email: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Please complete all information to create an account.")
                .font(.headline).fontWeight(.medium)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.vertical)
            
            InputView(
                placeholder: "Email or phone number",
                text: $email
            )
            
            InputView(
                placeholder: "Full Name",
                text: $fullName
            )
            
            InputView(
                placeholder: "Password",
                isSecureField: true,
                text: $password
            )
            
            ZStack(alignment: .trailing) {
                InputView(
                    placeholder: "Confirm Password",
                    isSecureField: true,
                    text: $confirmPassword
                )
                
                Spacer()
                
                if !password.isEmpty && !confirmPassword.isEmpty {
                    VStack {
                        Image(systemName: "\(isValiPassword ? "checkmark" : "xmark").circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(isValiPassword ? .green : .red)
                    }
                }
            }
            
            Spacer()
            
            Button(
                action: {
                    Task {
                        await authViewModel.createUser(
                            with: email,
                            fullName: fullName,
                            password: password
                        )
                    }
                    
                },
                label: {
                Text("Create Account")
            })
            .buttonStyle(CapsuleButtonStyle())
            
        }
        .navigationTitle("Set up your account")
        .toolbarRole(.editor) // remove back button
        .padding()
    }
    
    var isValiPassword: Bool {
        confirmPassword == password
    }
}

#Preview {
    CreateAccountView()
}
