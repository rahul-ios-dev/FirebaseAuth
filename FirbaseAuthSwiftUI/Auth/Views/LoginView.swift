import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // image
                    Image("login_image")
                        .resizable()
                        .scaledToFit()
                    
                    Spacer().frame(height: 12)
                    // title
                    Text("Let's Connect with US!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Spacer().frame(height: 12)
                    // textfield
                    InputView(
                        placeholder: "Email or phone number",
                        text: $email
                    )
                    
                    InputView(
                        placeholder: "Password",
                        isSecureField: true,
                        text: $password
                    )
                    
                    // forgot
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot Password")
                                .foregroundStyle(.gray)
                                .font(.subheadline)
                                .fontWeight(.medium)
                        })
                    }
                    
                    
                    // login
                    Button(action: {
                        
                    }, label: {
                        Text("login")
                    })
                    .buttonStyle(CapsuleButtonStyle())
                    
                    
                    // bottom or
                    HStack(spacing: 16) {
                        line
                        Text("OR")
                            .fontWeight(.semibold)
                        line
                    }
                    .foregroundStyle(.gray)
                    
                    // apple
                    Button {
                        
                    } label: {
                        Label(
                            "Sign up with appple",
                            systemImage: "apple.logo"
                        )
                    }
                    .buttonStyle(
                        CapsuleButtonStyle(bgColor: .black)
                    )
                    
                    // google
                    
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Image("google")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("Sign up with google")
                        }
                    })
                    .buttonStyle(
                        CapsuleButtonStyle(
                            bgColor: .clear,
                            textColor: .black,
                            hasBoarder: true
                        )
                    )
                    
                    // footer
                    NavigationLink {
                        
                    } label: {
                        HStack {
                            Text("Don't have an account?")
                                .foregroundStyle(.black)
                            Text("Sign Up")
                                .foregroundStyle(.teal)
                        }
                        .fontWeight(.medium)
                    }

                }
            }
            .ignoresSafeArea()
            .padding(.horizontal)
        .padding(.vertical, 8)
        }
    }
    
    private var line: some View {
        VStack { Divider().frame(height: 1)}
    }
}

#Preview {
    LoginView()
}


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
