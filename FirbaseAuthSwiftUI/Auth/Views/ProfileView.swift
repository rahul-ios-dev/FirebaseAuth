//
//  ProfileView.swift
//  FirbaseAuthSwiftUI
//
//  Created by Rahul Acharya on 09/12/24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Spacer()
            if let currentUser = authViewModel.currentUser {
                Text(currentUser.fullName)
            } else {
                ProgressView("Please wait...")
            }
            Spacer()
            
            Button {
                authViewModel.singOut()
            } label: {
                Text("Sign Out")
            }
        }
    }
}

#Preview {
    ProfileView()
}
