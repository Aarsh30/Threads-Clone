//
//  ProfileView.swift
//  Threads
//
//  Created by Aarsh  Patel on 05/02/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
   
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            //bio and stats
            VStack (spacing:20){
                ProfileHeaderView(user: user)
                Button{
                    
                }label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352,height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                //user content list view
              UserContentListView(user: user)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing)
            {
                Button{
                    AuthService.shared.signOut()
                }label: {
                    Image(systemName: "line.3.horizontal")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        
    }
}

//#Preview {
//    ProfileView(user: dev.user)
//}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let dev = DeveloperPreview.shared // Define dev here
        
        ProfileView(user: dev.user)
    }
}
