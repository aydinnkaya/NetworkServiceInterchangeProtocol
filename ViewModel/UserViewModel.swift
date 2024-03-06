//
//  UserViewModel.swift
//  NetworkServiceInterchangeProtocol
//
//  Created by Aydın KAYA on 6.03.2024.
//

import Foundation

class UserListViewModel : ObservableObject {
    
    @Published var userList = [UserViewModel]()
   // let webService = Webservice()
    private var service : Networkservice
    
    init(userList: [UserViewModel] = [UserViewModel](), service: Networkservice) {
        self.userList = userList
        self.service = service
    }
    
    
    
    func downloadUsers() async {
        
        var resource = ""
                
                if service.type == "Webservice" {
                    resource = Constants.Urls.usersExtension
                } else {
                    resource = Constants.Paths.baseUrl
                }
       
        do {
            let users = try await service.download(resource)

            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }

        } catch {
            print(error)
        }
        
    }
    
    
}


struct UserViewModel {
    
    let user : User
    
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var username : String {
        user.username
    }
    
    var email: String {
        user.email
    }
    
}
