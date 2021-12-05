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
        super.viewWillAppear(animated) // what is this (animated)???
        
        clearLogButton.layer.cornerRadius = 10
        clearLogButton.clipsToBounds = true
        
        addTransactionToLog() // method calls whenever I go to Stats View
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
    }
    
    // TO MAKE IT WORK!
    // 1. Use array instead of String in textView
    // 2. Watch this video - https://www.youtube.com/watch?v=ATR9gjRezKw&list=PLY4rE9dstrJyPbNmc1GjVUrfKjRakp-Dj&index=16
    /*
    func saveLog() {
        UserDefaults.standard.set(textView.text, forKey: "LogKey")
        UserDefaults.standard.synchronize()
    }
    
    func loadLog() {
        if let log = UserDefaults.standard.array(forKey: "LogKey") as? [String] {
            textView.text = log
        }
    }
 */
}
