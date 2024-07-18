//
//  BottomNavigationView.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 17/07/24.  BottomNavigationView
//

import SwiftUI

struct BottomNavigationView: View {
    @State private var selectedIndex: Int = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            NavigationStack() {
                HStack{
                    Text("Home").font(.system(size: 22, weight: .bold)).foregroundColor(.white)
                }.frame(maxWidth: .infinity, maxHeight: 40).background(Color.blue)
                Spacer()
            }
            .tabItem {
                Text("Home view")
                Image(systemName: "house.fill").renderingMode(.template)
            }
            .tag(0)
            NavigationStack() {
                HStack{
                    Text("Profile").font(.system(size: 22, weight: .bold)).foregroundColor(.white)
                }.frame(maxWidth: .infinity, maxHeight: 40).background(Color.blue)
                Spacer()
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            .tag(1)
            
            NavigationStack() {
                HStack{
                    Text("About View").font(.system(size: 22, weight: .bold)).foregroundColor(.white)
                }.frame(maxWidth: .infinity, maxHeight: 40).background(Color.blue)
                Spacer()
            }
            .tabItem {
                Text("About view")
                Image(systemName: "info.circle")
            }
            .tag(2)
        }
        //1
        .tint(.blue)
        .onAppear(perform: {
            //2
            UITabBar.appearance().unselectedItemTintColor = .gray
            //3
            UITabBarItem.appearance().badgeColor = .systemPink
            //4
            UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)
            //5
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]
            // UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
            //Above API will kind of override other behaviour and bring the default UI for TabView
        })
    }
}

#Preview {
    BottomNavigationView()
}
