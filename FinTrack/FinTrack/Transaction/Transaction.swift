import Foundation

class Transaction {
    static var transactionCategories: [String] = ["Food", "Health", "Bills", "Transport", "Pets", "Gifts", "Delivery", "Eating out", "Sports", "Entertainment", "Taxi", "Clothes"]
    var category: String = transactionCategories[0]
    var amount: String = "0"
    var option: TransactionOption = .unknown
    var date: String = "unknown date"
    
    init(category: String, amount: String, option: TransactionOption, date: String) {
        self.category = category
        self.amount = amount
        self.option = option
        self.date = date
    }
    
    // Get current date and time
    static func getDate() -> String {
        // get the current date and time
        let currentDate = Date()
        // initialize the date formatter and
        let formatter = DateFormatter()
        // set the style
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        // return the date time String from the date object
        return formatter.string(from: currentDate)
    }
}

enum TransactionOption {
    case income, expense, unknown
}
