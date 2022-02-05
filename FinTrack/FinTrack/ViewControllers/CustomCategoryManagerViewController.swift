import UIKit

class CustomCategoryManagerViewController: UIViewController {
    
    @IBOutlet var categoryNameTextField: UITextField!
    @IBOutlet var createButton: UIButton!
    @IBOutlet var categorySelector: UIPickerView!
    // Current selected Categroy in UIPickerView
    var selectedCategory: String = "Food"
    @IBOutlet var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dismiss keyboard on tap (tap outside the keyboard)
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Show data for categorySelector
        categorySelector.dataSource = self
        categorySelector.delegate = self
    }
    
    @IBAction func createButtonAction(_ sender: Any) {
        if let categoryNameTextFieldUnwrapped = categoryNameTextField.text {
            if !categoryNameTextFieldUnwrapped.isEmpty {
                Transaction.transactionCategories.append(categoryNameTextFieldUnwrapped)
                
                let alert = UIAlertController(title: "Category \"\(categoryNameTextFieldUnwrapped)\" successfully created", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("Ok!", comment: "\"Ok\" action"), style: .default, handler: { _ in
                }))
                self.present(alert, animated: true, completion: nil)
                
                categorySelector.reloadAllComponents()
            }
            else {
                return
            }
        }
        else {
            let alert = UIAlertController(title: "Category cannot be unnamed!", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Ok!", comment: "\"Ok\" action"), style: .default, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        if Transaction.transactionCategories.count > 1 {
            if Transaction.transactionCategories.contains(selectedCategory) {
                let selectedCategoryIndex = Transaction.transactionCategories.firstIndex(of: selectedCategory)
                Transaction.transactionCategories.remove(at: selectedCategoryIndex!)
            }
            
            let alert = UIAlertController(title: "Category \"\(selectedCategory)\" successfully removed", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Ok!", comment: "\"Ok\" action"), style: .default, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
            
            categorySelector.reloadAllComponents()
        }
        else {
            let alert = UIAlertController(title: "You need to have at least 1 category!", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Ok!", comment: "\"Ok\" action"), style: .default, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension CustomCategoryManagerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Transaction.transactionCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = Transaction.transactionCategories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Transaction.transactionCategories[row]
    }
}

