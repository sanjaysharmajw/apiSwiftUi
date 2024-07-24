import Foundation

class UserViewModel: ObservableObject {
    
    @Published var userList: UserList?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    @Published var alertItem: AlertItem?

    func userListApi() {
        
        isLoading = true
        UserListNetwork.shared.userList { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let response):
                    self.userList = response
                self.errorMessage = nil
                    UserDefaultsManager.shared.saveLoginToken("Sanjay")
                case .failure(let error):
                    self.userList = nil
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
