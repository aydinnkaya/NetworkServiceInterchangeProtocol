//
//  Networkservice.swift
//  NetworkServiceInterchangeProtocol
//
//  Created by Aydın KAYA on 6.03.2024.
//

import Foundation

protocol Networkservice{
    func download(_ resource: String) async throws -> [User]
    var type : String { get }
}
