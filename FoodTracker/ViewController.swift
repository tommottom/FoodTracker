//
//  ViewController.swift
//  FoodTracker
//
//  Created by 高橋智貴 on 2015/11/10.
//  Copyright © 2015年 高橋智貴. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK：プロパティ

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK：アクション

    @IBAction func setDefaultLabelText(sender: UIButton) {
         mealNameLabel.text = "Default Text"
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // User chaege TextField note
        mealNameLabel.text = textField.text
    }
}

