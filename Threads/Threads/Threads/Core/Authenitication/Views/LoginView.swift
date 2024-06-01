//
//  LoginView.swift
//  Threads
//
//  Created by Aarsh  Patel on 02/02/24.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            
            VStack{
                Spacer()
                Image("threads-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack{
                    TextField("Enter your Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifiers())
                    SecureField("Enter your Password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifiers())
                }
                NavigationLink{
                    Text("Forget Password")
                }label: {
                    Text("Forget Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing,28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,alignment: .trailing)
                }
                Button{
                    Task {
                        try await viewModel.login()
                    }
                }
            label: {
                Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352,height: 44)
                    .background(.black)
                    .cornerRadius(8)
                
            }
                Spacer()
                Divider()
                NavigationLink{
//                    Text("Registration View")
                    RegistartionView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack(spacing: 3){
                        Text("Don't have a account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical,16)
                
                
            }
        }
    }
}

#Preview {
    LoginView()
}
