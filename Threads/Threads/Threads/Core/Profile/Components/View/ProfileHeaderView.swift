//
//  ProfileHeaderView.swift
//  Threads
//
//  Created by Aarsh  Patel on 07/02/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    init(user: User? = nil) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment:.top) {
            VStack(alignment: .leading, spacing: 12) {
                //fullname and username
                
                VStack(alignment:.leading,spacing: 4)
                {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio{
                    Text(bio)
                        .font(.footnote)
                }
                Text("100M follower")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            CircularProfileImageView(user: user,size: .medium)
        }
    }
}

//#Preview {
//    ProfileHeaderView(user: dev.user)
//}
struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let dev = DeveloperPreview.shared // Define dev here
        
        ProfileHeaderView(user: dev.user)
    }
}

