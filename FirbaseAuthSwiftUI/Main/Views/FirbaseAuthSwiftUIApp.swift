//
//  FirbaseAuthSwiftUIApp.swift
//  FirbaseAuthSwiftUI
//
//  Created by Rahul Acharya on 14/11/24.
//

import SwiftUI
import UIKit
import FirebaseCore


class ApplicationDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
    
}

@main
struct FirbaseAuthSwiftUIApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(ApplicationDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
