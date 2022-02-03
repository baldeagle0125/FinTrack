//
//  CustomCategoryManagerViewController.swift
//  FinTrack
//
//  Created by Igor Melashchenko on 12/4/21.
//

import UIKit

class CustomCategoryManagerViewController: UIViewController {
    
    @IBOutlet var categoryNameTextField: UIStackView!
    @IBOutlet var createButton: UIButton!
    @IBOutlet var categorySelector: UIDatePicker!
    @IBOutlet var deleteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Make buttons rounded
        createButton.layer.cornerRadius = 10
        createButton.clipsToBounds = true
        deleteButton.layer.cornerRadius = 10
        deleteButton.clipsToBounds = true
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
