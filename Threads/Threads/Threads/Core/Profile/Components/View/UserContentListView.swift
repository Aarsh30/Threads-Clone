//
//  UserContentListView.swift
//  Threads
//
//  Created by Aarsh  Patel on 08/02/24.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject var viewModel: UserContentListViewModel
    @State private var  selectedFilter: Profilethreadfilter = .threads
    @Namespace var animation
    
    private var filterBarWidth : CGFloat{
        let count = CGFloat(Profilethreadfilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    init(user: User)
    {
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            HStack{
                ForEach(Profilethreadfilter.allCases){filter in
                    VStack{
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold: .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width:filterBarWidth ,height:1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        }else{
                            Rectangle()
                                .foregroundStyle(.clear)
                                .frame(width: filterBarWidth , height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring())
                        {
                            selectedFilter = filter
                        }
                    }
                }
            }
            LazyVStack{
                ForEach(viewModel.threads){ thread in
                    ThreadCell(thread: thread)
                }
            }
        }
        .padding(.vertical,8)
    }
}

//#Preview {
//    UserContentListView(user: dev.user)
//}

struct UserContentListView_Previews: PreviewProvider {
    static var previews: some View {
        let dev = DeveloperPreview.shared // Define dev here
        
        UserContentListView(user: dev.user)
    }
}
