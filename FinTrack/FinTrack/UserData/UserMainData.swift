import Foundation

class UserMainData {
    var userBalance: String
    var userLastTransaction: String
    var userCategories: [String]
    
    init(userBalance: String, userLastTransaction: String, userCategories: [String]) {
        self.userBalance = userBalance
        self.userLastTransaction = userLastTransaction
        self.userCategories = userCategories
    }
}
