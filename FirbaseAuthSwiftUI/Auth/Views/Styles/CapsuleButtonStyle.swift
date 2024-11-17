//
//  CapsuleButtonStyle.swift
//  FirbaseAuthSwiftUI
//
//  Created by Rahul Acharya on 15/11/24.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    var bgColor: Color = .teal
    var textColor: Color = .white
    var hasBoarder: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(textColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Capsule().fill(bgColor))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .overlay {
                hasBoarder ?
                Capsule()
                    .stroke(
                        .gray,
                        lineWidth: 1.0
                    ) :
                nil
            }
    }
}
