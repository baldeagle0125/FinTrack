//
//  ViewController.swift
//  FinTrack
//
//  Created by Igor Melashchenko on 8/27/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var currentBalance: UILabel!
    @IBOutlet var lastTransactionDate: UILabel!
    @IBOutlet var categorySelection: UIPickerView!
    // Current selected Categroy in UIPickerView
    var selectedCategory: String = "Food"
    @IBOutlet var selCate: UILabel!
    @IBOutlet var newExpenseButtonOutlet: UIButton!
    @IBOutlet var newIncomeButtonOutlet: UIButton!
    @IBOutlet var customButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make buttons rounded
        newExpenseButtonOutlet.layer.cornerRadius = 10
        newExpenseButtonOutlet.clipsToBounds = true
        newIncomeButtonOutlet.layer.cornerRadius = 10
        newIncomeButtonOutlet.clipsToBounds = true
        customButtonOutlet.layer.cornerRadius = 10
        customButtonOutlet.clipsToBounds = true
        
        // Dismiss keyboard on tap (tap outside the keyboard)
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        // Show data for categorySelection
        categorySelection.dataSource = self
        categorySelection.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Reload PickerView components
        categorySelection.reloadAllComponents()
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func newExpenseButton(_ sender: Any) {
        // Output an alert if Text Field is empty
        if (amountTextField.text?.isEmpty == true || amountTextField.text == "0") {
            let alert = UIAlertController(title: "Amount error!", message: "Amount can't be 0 or empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        currentBalance.text = String(Double(currentBalance.text!)! - Double(amountTextField.text!)!)
        
        let transactionDate = Transaction.getDate()
        let transactionCategory = Transaction.transactionCategories.firstIndex(of: selectedCategory)
        
        let newTransaction = Transaction(category: Transaction.transactionCategories[transactionCategory!], amount: "-" + amountTextField.text!, option: .expense, date: transactionDate)
        
        // Add date to lastTransactionDate
        lastTransactionDate.text = transactionDate
        
        
        
        
        
        newTransactionGlobal = newTransaction
        
        
        
        
        
        // Clear amountTextField
        amountTextField.text = ""
    }
    
    @IBAction func newIncomeButton(_ sender: Any)  {
        // Output an alert if amountTextField is empty
        if (amountTextField.text?.isEmpty == true || amountTextField.text == "0") {
            let alert = UIAlertController(title: "Amount error!", message: "Amount can't be 0 or empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        currentBalance.text = String(Double(currentBalance.text!)! + Double(amountTextField.text!)!)
        
        let transactionDate = Transaction.getDate()
        let transactionCategory = Transaction.transactionCategories.firstIndex(of: selectedCategory)
        
        let newTransaction = Transaction(category: Transaction.transactionCategories[transactionCategory!], amount: "+" + amountTextField.text!, option: .income, date: transactionDate)
        
        // Add date to lastTransactionDate
        lastTransactionDate.text = transactionDate
        
        
        
        
        
        newTransactionGlobal = newTransaction
        
        
        
        
        
        // Clear amountTextField
        amountTextField.text = ""
    }
    
    @IBAction func unwindToMainViewController(segue: UIStoryboardSegue) {
        categorySelection.reloadAllComponents()
    }
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Transaction.transactionCategories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = Transaction.transactionCategories[row]
        selCate.text = Transaction.transactionCategories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if Transaction.transactionCategories.indices.contains(row) {
            return Transaction.transactionCategories[row]
        } else {
            Transaction.transactionCategories.append("")
            return Transaction.transactionCategories[row]
        }
    }
}
