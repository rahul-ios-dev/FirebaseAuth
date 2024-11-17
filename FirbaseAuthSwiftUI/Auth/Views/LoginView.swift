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
                    forgotButton
                    
                    // login
                    loginButton
                    
                    Spacer()
                    
                    bottomView
                }
            }
            .ignoresSafeArea()
            .padding(.horizontal)
            .padding(.vertical, 8)
            .scrollIndicators(.hidden)
        }
    }
    
    private var bottomView: some View {
        VStack(spacing: 16) {
            // bottom or
            lineOrView
            
            // apple
            appleButton
            
            // google
            googleButton
            
            // footer
            footerView
        }
    }
    
    private var forgotButton: some View {
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
    }
    
    private var loginButton: some View {
        Button(action: {
            
        }, label: {
            Text("login")
        })
        .buttonStyle(CapsuleButtonStyle())
    }
    
    private var line: some View {
        VStack { Divider().frame(height: 1)}
    }
    
    private var lineOrView: some View {
        HStack(spacing: 16) {
            line
            Text("OR")
                .fontWeight(.semibold)
            line
        }
        .foregroundStyle(.gray)
    }
    
    private var appleButton: some View {
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
    }
    
    private var googleButton: some View {
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
    }
    
    private var footerView: some View {
        NavigationLink {
            CreateAccountView()
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

#Preview {
    LoginView()
}
