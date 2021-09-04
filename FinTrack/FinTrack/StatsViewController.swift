//
//  StatsViewController.swift
//  FinTrack
//
//  Created by Igor Melashchenko on 9/4/21.
//

import UIKit

var amountToReceive: String = "" // get rid of global scoope variable. FIND ANOTHER SOLUTION

class StatsViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text.append(amountToReceive) // don't need this???
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated == true) // what is this???
        
        updateTextView()
    }
    
    func updateTextView() {
        textView.text.append(amountToReceive + "\n")
    }

    @IBAction func clearLog(_ sender: Any) {
        textView.text.removeAll()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
