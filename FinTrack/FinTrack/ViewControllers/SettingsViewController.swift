import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var languageSelection: UIPickerView!
    
    var selectedLanguage: String = ""
    @IBOutlet var currencySelection: UIPickerView!
    
    var selectedCurrency: String = ""
    @IBOutlet var selLang: UILabel!
    @IBOutlet var selCurr: UILabel!
    @IBOutlet var restoreLogOutlet: UIButton!
    @IBOutlet var restorePurchasesOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        languageSelection.dataSource = self
        languageSelection.delegate = self
        
        currencySelection.dataSource = self
        currencySelection.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        restoreLogOutlet.layer.cornerRadius = 10
        restoreLogOutlet.clipsToBounds = true
        restorePurchasesOutlet.layer.cornerRadius = 10
        restorePurchasesOutlet.clipsToBounds = true
    }
}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = Settings.Languages.count
        
        if pickerView == currencySelection {
            countrows = Settings.Currencies.count
        }
        
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == languageSelection {
            let titleRow = Settings.Languages[row]
            return titleRow
        } else if pickerView == currencySelection {
            let titleRow = Settings.Currencies[row]
            return titleRow
        }
        
        return ""
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == languageSelection {
            Settings.selectedLanguage = Settings.Languages[row]
            self.selLang.text = Settings.Languages[row]
        } else if pickerView == currencySelection {
            Settings.selectedCurrency = Settings.Currencies[row]
            self.selCurr.text = Settings.Currencies[row]
        }
    }
    
    @IBAction func unwindToSettingsViewController(segue: UIStoryboardSegue) {
        
    }
}
