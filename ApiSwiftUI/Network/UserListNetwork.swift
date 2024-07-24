//
//  UserListNetwork.swift
//  ApiSwiftUI
//
//  Created by Sanjay Sharma on 23/07/24.
//

import Foundation

class UserListNetwork {

    static let shared = UserListNetwork()
    
    func userList(completed: @escaping (Result<UserList, APError>) -> Void) {
        guard let url = URL(string: "https://reqres.in/api/users?page=2") else {
            completed(.failure(.invalidURL))
            return
        }
    
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ =  error  {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let loginResponse = try JSONDecoder().decode(UserList.self, from: data)
                completed(.success(loginResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
    
}
