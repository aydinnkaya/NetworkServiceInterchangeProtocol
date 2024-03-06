//
//  Webservice.swift
//  NetworkServiceInterchangeProtocol
//
//  Created by Aydın KAYA on 6.03.2024.
//

import Foundation

enum NetworkError : Error {
    case invalidUrl
    case invalidServerResponse
}

class Webservice : Networkservice {
     
    var type: String = "Webservice"
    
    func download(_ resource: String) async throws -> [User] {
        
        
        guard let url = URL(string: resource) else {
            throw NetworkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.invalidServerResponse
        }
        
        return try JSONDecoder().decode([User].self, from: data)
    }
    
}
