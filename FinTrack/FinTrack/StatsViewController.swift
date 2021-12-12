//
//  StatsViewController.swift
//  FinTrack
//
//  Created by Igor Melashchenko on 9/4/21.
//

import UIKit

var newTransactionGlobal = Transaction(category: "", amount: "", option: .expense, date: "") // get rid of global scope variable. FIND ANOTHER SOLUTION

class StatsViewController: UIViewController {
    
    // Outlets
    @IBOutlet var clearLogButton: UIButton!
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        clearLogButton.layer.cornerRadius = 10
        clearLogButton.clipsToBounds = true
        
        addTransactionToLog() // method calls whenever I go to Stats View
        // Rework this
    }
    
    func addTransactionToLog() {
        let newTransactionLogItem = TransactionLog(amount: newTransactionGlobal.amount, category: newTransactionGlobal.category, date: newTransactionGlobal.date)
        
        let output: String = "\(newTransactionLogItem.amount); \(newTransactionLogItem.category); \(newTransactionLogItem.date)"
        textView.text.append("\n")
        textView.text.append(output)
    }

    @IBAction func clearLog(_ sender: Any) {
        textView.text.removeAll()
        textView.text.append("amount; category; date, time;\n")
        textView.text.append("------------------------------")
        
        // Output to Xcode console
        print("Working print | Log cleared") // not working, remove this, use NSLog instead
        NSLog("Log cleared")
    }
}
