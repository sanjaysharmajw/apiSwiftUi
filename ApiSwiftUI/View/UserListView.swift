//
//  UserListView.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 23/07/24.
//

import SwiftUI

import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel = UserViewModel()

    var body: some View {
            List {
                if let userList = viewModel.userList {
                    ForEach(userList.data, id: \.id) { user in
                        VStack(alignment: .leading) {
                            Text("\(user.firstName)\(user.lastName)").font(.headline)
                            Text(user.email).font(.subheadline)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.userListApi()
                }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
            }
        }
    }



#Preview {
    UserListView()
}
