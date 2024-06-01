//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by Aarsh  Patel on 05/02/24.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize{
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xlarge
    
    var dimension: CGFloat{
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xlarge: return 80
        }
    }
}

struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
//    init(user: User? = nil) {
//        self.user = user
//    }
    var body: some View {
        if let imageUrl = user?.profileImageUrl{
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFit()
               // .frame(width: 40, height: 40)
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width:size.dimension, height: size.dimension)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

//#Preview {
//    CircularProfileImageView()
//}
struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        let dev = DeveloperPreview.shared // Define dev here
        
        CircularProfileImageView(user: dev.user, size: .medium)
    }
}

