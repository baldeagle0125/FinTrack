import Foundation

class Settings {
    static var Languages = ["English", "Spanish", "French", "German", "Italian"]
    static var Currencies = ["(USD) US dollar", "(EUR) Euro"]
    static var selectedLanguage: String = Languages[0]
    static var selectedCurrency: String = Currencies[0]
    static var theme: Theme = .deviceCurrentTheme
    static var moveToStatsTabAfterTransaction: Bool = false //{
        //tabBarController?.selectedIndex = 0 // opens first tab  USE THIS!! ADD THIS TO SETTINGS AS A CHOICE
    //}
    
    func restoreLog() {
        // TODO
    }
    
    func restoreInAppPurchases() {
        // TODO
    }
}

enum Theme {
    case light, dark, deviceCurrentTheme
}
