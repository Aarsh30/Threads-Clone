//
//  ThreadView.swift
//  Threads
//
//  Created by Aarsh  Patel on 05/02/24.
//

import SwiftUI

struct ThreadView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    CircularProfileImageView(user: user, size: .small)
                    VStack(alignment: .leading,spacing: 4)
                    {
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        TextField("Starting the thread", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    Spacer()
                    if !caption.isEmpty {
                        Button{
                            caption = " "
                        }label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12,height: 12)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading)
                {
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    Button("Post"){
                        Task { try await viewModel.uploadThread(caption: caption)
                        dismiss()
                        }
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
              
            }
        }
        
    }
}

#Preview {
    ThreadView()
}

//struct ThreadView_Previews: PreviewProvider {
//    static var previews: some View {
//        let dev = DeveloperPreview.shared // Define dev here
//         
//        ThreadView(user: dev.user)
//    }
//}
