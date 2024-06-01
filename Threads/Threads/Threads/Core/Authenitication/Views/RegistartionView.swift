//
//  RegistartionView.swift
//  Threads
//
//  Created by Aarsh  Patel on 05/02/24.
//

import SwiftUI

struct RegistartionView: View {
    @StateObject var viewModel = RegistrationViewModel()
  
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            Image("threads-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack{
                TextField("Enter your Email", text: $viewModel.email)
                    .textInputAutocapitalization(.none)
                    .modifier(ThreadsTextFieldModifiers())
                SecureField("Enter your Password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifiers())
                TextField("Enter your full name", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifiers())
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(ThreadsTextFieldModifiers())
            }
            Button{
                Task{
                    try await viewModel.createUser()
                }
            }
        label: {
            Text("Sign Up")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 352,height: 44)
                .background(.black)
                .cornerRadius(8)
            
        }
        .padding(.vertical)
            Spacer()
            Divider()
            Button{
                dismiss()
            }label: {
                HStack(spacing: 3){
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    RegistartionView()
}
