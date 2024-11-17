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
                text: $password
            )
            
            InputView(
                placeholder: "Confirm Password",
                text: $confirmPassword
            )
            
            Spacer()
            
            Button(action: {
                
            }, label: {
                Text("Create Account")
            })
            .buttonStyle(CapsuleButtonStyle())
            
        }
        .navigationTitle("Set up your account")
        .padding()
    }
    
    var isValiPassword: Bool {
        confirmPassword == password
    }
}

#Preview {
    CreateAccountView()
}
