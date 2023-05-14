//
//  NetworkService.swift
//  ObserverDesignPattern
//
//  Created by İbrahim Bayram on 9.05.2023.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    var user : User?
    
    private init() {}
    
    func login(email : String, password : String, completion :  @escaping(Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2)  { [weak self] in
            if email == "ibo@gmail.com" && password == "123456" {
                self?.user = User(firstName: "Ibrahim", lastName: "Bayram", email: "ibo@gmail.com", age: 20)
                completion(true)
            }else {
                self?.user = nil
                completion(false)
            }
        }
    }
}
