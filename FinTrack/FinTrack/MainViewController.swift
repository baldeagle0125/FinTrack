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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
         let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
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
            
            amountToReceive = "-" + String(unwrappedPassedAmount)
            tabBarController?.selectedIndex = 0 // opens first tab
        }
    }
    @IBAction func newIncomeButton(_ sender: Any) {
        if let unwrappedPassedAmount = amountTextField.text {
            let tempAmount: Double = Double(currentBalance.text!)! + Double(unwrappedPassedAmount)!
            currentBalance.text! = String(tempAmount)
            
            amountToReceive = "+" + String(unwrappedPassedAmount)
            tabBarController?.selectedIndex = 0 // opens first tab
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
}

