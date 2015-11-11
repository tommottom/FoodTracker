//
//  ViewController.swift
//  FoodTracker
//
//  Created by 高橋智貴 on 2015/11/10.
//  Copyright © 2015年 高橋智貴. All rights reserved.
//

// ViewControllerClass: 継承 UIViewController & UITextFieldDelegate
// Outlet 参照先の生成と明示

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    // MARK：プロパティ

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.(リターンキーが押されたらキーボードを隠す + 入力を終了させる。)
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    // MARK：アクション
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    
    //UIButtonを利用するためのメソッドを生成
    //ボタンが押されたら、代入される文字列を出力する。
   // @IBAction func setDefaultLabelText(sender: UIButton) {
        // mealNameLabel.text = "Default Text"
    //}
    
    //UITextFieldを利用するためのメソッドを生成
    func textFieldDidEndEditing(textField: UITextField) {
        // User chaege TextField note
        // mealNameLabel.text = テキストフィールドに入力された値を出力する。
        // TextFieldに入力された値を代入するを左項に代入する。
        mealNameLabel.text = textField.text
    }
}

