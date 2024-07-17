import Foundation
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var email: String = "eve.holt@reqres.in"
    @Published var password: String = "cityslicka"
    @Published var isLoading: Bool = false
    @Published var loginResponse: LoginModel?
    @Published var errorMessage: String?
    @Published var alertItem: AlertItem?

    func login() {
        isLoading = true
        let loginRequest = LoginRequest(email: email, password: password)
        LoginNetwork.shared.login(requestLogin: loginRequest) { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let response):
                self.loginResponse = response
                self.errorMessage = nil
                case .failure(let error):
                    self.loginResponse = nil
                    self.errorMessage = error.localizedDescription
                    
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                        
                    }
                    
                }
            }
        }
    }
}
