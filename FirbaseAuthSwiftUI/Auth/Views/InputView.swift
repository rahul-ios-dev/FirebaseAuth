//
//  InputView.swift
//  FirbaseAuthSwiftUI
//
//  Created by Rahul Acharya on 14/11/24.
//

import SwiftUI

struct InputView: View {
    let placeholder: String
    var isSecureField: Bool = false
    @Binding var text: String
    
    
    var body: some View {
        VStack (spacing: 12, content: {
            if isSecureField {
                SecureField(placeholder, text: $text)
            }else {
                TextField(placeholder, text: $text)
            }
            Divider()
        })
    }
}

#Preview {
    InputView(
        placeholder: "Email or Phone number",
        text: .constant("")
    )
}
