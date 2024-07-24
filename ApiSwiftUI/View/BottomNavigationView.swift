//
//  BottomNavigationView.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 17/07/24.  BottomNavigationView
//

import SwiftUI

struct BottomNavigationView: View {
    @State private var selectedTab = 0
    @State private var title = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
                .onAppear {
                        title = "Home"
                        }
            
            ListView()
                .tabItem {
                    Label("List", systemImage: "list.dash")
                }
                .tag(1)
                .onAppear {
                        title = "List"
                        }
            
            NotificationView()
                .tabItem {
                    Label("Notification", systemImage: "bell")
                }
                .tag(2)
                .onAppear {
                        title = "Notification"
                        }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(3)
                .onAppear {
                        title = "Profile"
                        }
        }
        .navigationTitle(title).font(.title)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            // Notification bell icon on the right side
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Handle notification bell tap
                    print("Notification bell tapped")
                }) {
                    Image(systemName: "bell")
                        .foregroundColor(.white)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(false) // Ensure navigation bar is visible
    }
}

struct HomeView: View {
    var body: some View {

        Text("Home View")
            .navigationTitle("Home") // Navigation title for Home
    }
}

struct ListView: View {
    var body: some View {
        UserListView()
    }
}

struct NotificationView: View {
    var body: some View {
        Text("Notification View")
            .navigationTitle("Notification") // Navigation title for Notification
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
            .navigationTitle("Profile") // Navigation title for Profile
    }
}

#Preview {
    BottomNavigationView()
}
