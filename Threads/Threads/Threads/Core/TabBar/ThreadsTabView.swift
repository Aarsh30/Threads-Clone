//
//  ThreadsTabView.swift
//  Threads
//
//  Created by Aarsh  Patel on 05/02/24.
//

import SwiftUI

struct ThreadsTabView: View {
    @State private var selectedTab = 0
    @State private var showCreatedThread = false
    var body: some View {
        TabView(selection: $selectedTab)
        {
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants,selectedTab == 0 ? .fill : .none)
                        }
                .onAppear {
                    selectedTab = 0
                }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear {
                    selectedTab = 1
                }
                .tag(1)
            Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear {
                    selectedTab = 2
                }
                .tag(2)
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants,selectedTab == 3 ? .fill : .none)
                        
                }
                .onAppear {
                    selectedTab = 3
                }
                .tag(3)
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants,selectedTab == 4 ? .fill : .none)
                        }
                .onAppear {
                    selectedTab = 4
                }
                .tag(4)
        }
     
        .onChange(of:selectedTab,perform: {newValue in
        showCreatedThread = selectedTab == 2
        })
        .sheet(isPresented:$showCreatedThread, onDismiss: {selectedTab = 0} ,
               content: {
            ThreadView()
        })
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
