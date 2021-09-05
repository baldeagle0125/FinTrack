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
    let categories = ["Food", "Health", "Bills", "Transport", "Pets", "Gifts", "Delivery", "Eating out", "Sports", "Entertainment", "Taxi", "Clothes"]
    var selectedCategory: String = ""
    @IBOutlet var selCate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
        
        categorySelection.dataSource = self
        categorySelection.delegate = self
    }
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func newExpenseButton(_ sender: Any) {
        if let unwrappedPassedAmount = amountTextField.text {
            let tempAmount: Double = Double(currentBalance.text!)! - Double(unwrappedPassedAmount)!
            currentBalance.text! = String(tempAmount)
            
            categoryToRecieve = selectedCategory
            
            amountToReceive = "-" + String(unwrappedPassedAmount)
            tabBarController?.selectedIndex = 0 // opens first tab
            
            lastTransactionDateToLabel()
            amountTextField.text?.removeAll()
        }
    }
    
    @IBAction func newIncomeButton(_ sender: Any) throws {
        // TODO ||| CATCH AN 'NIL IN TEXTFIELD' EXCEPTION
        /*
        if amountTextField.text == nil {
            // UIAlertController
            // 1st example
            /*
            let alertController = UIAlertController(title: "iOScreator", message:
                    "Can't be nil!", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                self.present(alertController, animated: true, completion: nil)
            */
            // 2nd example
            /*
            let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            */
        }
        */
        if let unwrappedPassedAmount = amountTextField.text {
            let tempAmount: Double = Double(currentBalance.text!)! + Double(unwrappedPassedAmount)!
            currentBalance.text! = String(tempAmount)
            
            amountToReceive = "+" + String(unwrappedPassedAmount)
            tabBarController?.selectedIndex = 0 // opens first tab
            
            lastTransactionDateToLabel()
            amountTextField.text?.removeAll()
        }
    }
    
    @IBAction func add10(_ sender: Any) {
        amountTextField.text = "10"
    }
    
    @IBAction func add50(_ sender: Any) {
        amountTextField.text = "50"
    }
    
    @IBAction func add100(_ sender: Any) {
        amountTextField.text = "100"
    }
    
    func lastTransactionDateToLabel() {
        // get the current date and time
        let currentDateTime = Date()
        // initialize the date formatter and
        let formatter = DateFormatter()
        // set the style
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        // get the date time String from the date object
        lastTransactionDate.text = formatter.string(from: currentDateTime)
    }
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = categories[row]
        selCate.text = categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
}
