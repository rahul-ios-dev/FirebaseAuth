//
//  AuthViewModel.swift
//  FirbaseAuthSwiftUI
//
//  Created by Rahul Acharya on 22/11/24.
//

import Foundation
import FirebaseAuth // auth
import FirebaseFirestore // storage

@MainActor
final class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User? // firebase user
    @Published var currentUser: User? // local user
    @Published var isError: Bool = false
    
    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    
    init() {
    }
    
    func login(email: String, password: String) async {
        do {
            let authResult = try await auth.signIn(withEmail: email, password: password)
            userSession = authResult.user
            
            await fetchUser(by: authResult.user.uid)
            
            print("current user:",currentUser)
        }
        catch {
            isError = true
        }
    }
    
    func createUser(
        with email: String,
        fullName: String,
        password: String
    )  async {
        
        do {
            // auth entry
            let authResult = try await auth.createUser(
                withEmail: email,
                password: password
            )
            
            // databse entry
            await storeUserInFirestore(
                with: authResult.user.uid,
                email: email,
                fullName: fullName
            )
        }
        catch {
            isError = true
        }
        
    }
    
    func storeUserInFirestore(
        with uid: String,
        email: String,
        fullName: String
    ) async{
        
        let user = User(uid: uid, email: email, fullName: fullName)
        do {
            try  firestore.collection("users").document(uid).setData(from: user)
        }
        catch {
            isError = true
        }
    }
    
    func fetchUser(by uid: String) async {
        do {
            let document = try await firestore.collection("users").document(uid).getDocument()
            self.currentUser = try document.data(as: User.self)
        }
        catch {
            isError = true
        }
    }
}
