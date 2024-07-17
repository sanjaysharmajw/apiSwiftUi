//
//  LoginNetwork.swift
//  SwiftUI-MVVM
//
//  Created by Sanjay Sharma on 15/07/24.
//

import Foundation

class LoginNetwork {

    static let shared = LoginNetwork()
    
    func login(requestLogin: LoginRequest, completed: @escaping (Result<LoginModel, APError>) -> Void) {
        guard let url = URL(string: "https://reqres.in/api/login") else {
            completed(.failure(.invalidURL))
            return
        }
    
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
      //  let loginRequest = LoginRequest(email: email, password: password)
        
        do {
            let jsonData = try JSONEncoder().encode(requestLogin)
            request.httpBody = jsonData
        } catch {
            completed(.failure(.invalidResponse))
            return
        }
        
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
                let loginResponse = try JSONDecoder().decode(LoginModel.self, from: data)
                completed(.success(loginResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
    
}
