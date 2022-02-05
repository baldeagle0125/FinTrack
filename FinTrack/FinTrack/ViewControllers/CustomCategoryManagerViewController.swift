import UIKit

class CustomCategoryManagerViewController: UIViewController {
    
    @IBOutlet var categoryNameTextField: UITextField!
    @IBOutlet var createButton: UIButton!
    @IBOutlet var categorySelector: UIPickerView!
    // Current selected Categroy in UIPickerView
    var selectedCategory: String = "Delivery"
    @IBOutlet var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Dismiss keyboard on tap (tap outside the keyboard)
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Make buttons rounded
        createButton.layer.cornerRadius = 10
        createButton.clipsToBounds = true
        deleteButton.layer.cornerRadius = 10
        deleteButton.clipsToBounds = true
        
        // Show data for categorySelector
        categorySelector.dataSource = self
        categorySelector.delegate = self
    }
    
    @IBAction func createButtonAction(_ sender: Any) {
        if let categoryNameTextFieldUnwrapped = categoryNameTextField.text {
            transactionCategories.append(categoryNameTextFieldUnwrapped)
            
            let alert = UIAlertController(title: "Category \"categoryNameTextFieldUnwrapped\" successfully added", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Ok!", comment: "\"Ok\" action"), style: .default, handler: { _ in
            }))
        }
    }
    
    @IBAction func deleteButtonAction(_ sender: Any) {
        if let categoryNameTextFieldUnwrapped = categoryNameTextField.text {
            for value in transactionCategories {
                if value == categoryNameTextFieldUnwrapped {
                    let valueIndex = transactionCategories.firstIndex(of: value)
                    transactionCategories.remove(at: valueIndex!)
                    
                    let alert = UIAlertController(title: "Category \"categoryNameTextFieldUnwrapped\" successfully removed", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("Ok!", comment: "\"Ok\" action"), style: .default, handler: { _ in
                    }))
                    
                    // Output to Xcode console
                    print("Index of \(value) is \(String(describing: valueIndex))")
                }
            }
        }
        
        //let selectedCategoryIndex = transactionCategories.firstIndex(of: selectedCategory)
        //transactionCategories.remove(at: selectedCategory!)
    }
}

extension CustomCategoryManagerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return transactionCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = transactionCategories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return transactionCategories[row]
    }
}

