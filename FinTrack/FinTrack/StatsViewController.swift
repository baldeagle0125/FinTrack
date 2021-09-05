//
//  StatsViewController.swift
//  FinTrack
//
//  Created by Igor Melashchenko on 9/4/21.
//

import UIKit

var amountToReceive: String = "" // get rid of global scoope variable. FIND ANOTHER SOLUTION
var categoryToRecieve: String = "" // get rid of global scoope variable. FIND ANOTHER SOLUTION

class StatsViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    
    var finalOutput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textView.text.append(amountToReceive) // don't need this???
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // what is this???
        
        updateTextView()
    }
    
    func updateTextView() {
        if !amountToReceive.isEmpty {
            let finalDate = transactionDate()
            
            finalOutput = "\(amountToReceive); \(categoryToRecieve); \(finalDate);"
            textView.text.append("\n")
            textView.text.append(finalOutput)
        }
    }

    @IBAction func clearLog(_ sender: Any) {
        textView.text.removeAll()
        textView.text.append("amount; category; date, time;\n")
        textView.text.append("------------------------------")
    }
    
    func transactionDate() -> String {
        // get the current date and time
        let currentDateTime = Date()
        // initialize the date formatter and
        let formatter = DateFormatter()
        // set the style
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        // get the date time String from the date object
        return formatter.string(from: currentDateTime)
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
