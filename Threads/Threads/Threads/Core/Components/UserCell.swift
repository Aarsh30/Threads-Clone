//
//  UserCell.swift
//  Threads
//
//  Created by Aarsh  Patel on 05/02/24.
//

import SwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack{
            CircularProfileImageView(user: user, size: .small)
            
            VStack(alignment:.leading){
                Text(user.username)
                  
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                    .font(.footnote)
                    
            }
            .font(.footnote)
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100,height: 32)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( Color(.systemGray4),lineWidth:1)
                }
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    UserCell(user: dev.user)
//}
struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        let dev = DeveloperPreview.shared // Define dev here
        
        UserCell(user: dev.user)
    }
}
