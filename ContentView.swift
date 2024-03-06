//
//  ContentView.swift
//  NetworkServiceInterchangeProtocol
//
//  Created by Aydın KAYA on 6.03.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userListViewModel : UserListViewModel
    
    init() {
        self.userListViewModel = UserListViewModel()
    }
    
    var body: some View {
        List(userListViewModel.userList,id: \.id) { user in
            VStack {
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment:.leading)
                Text(user.username)
                    .foregroundColor(.green)
                    .frame(maxWidth: .infinity, alignment:.leading)
                Text(user.email)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment:.leading)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}


#Preview {
    ContentView()
}
