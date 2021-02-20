//
//  Service.swift
//  MVVMPractice
//
//  Created by Pritesh Kankaria on 19/02/21.
//

import Foundation

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchUsers(completion: @escaping ([User]?, Error?) -> ()) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                print("Failed to fetch users:", error)
                return
            }
            
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    completion(users, nil)
                    
                }
            } catch {
                print("Failed to decode:", error)
            }
        }.resume()
    }
}

