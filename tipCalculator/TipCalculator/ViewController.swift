//
//  ViewController.swift
//  tipCalculator
//
//  Created by yoshizawarei on 2018/10/02.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billAmount: UITextField!
//    @IBOutlet weak var tipParcentage: UITextField!
    @IBOutlet weak var numOfPeople: UITextField!
    @IBOutlet weak var tipParcentage: UILabel!
    
    @IBAction func adjustTipPercentage(_ sender: UISlider) {
        tipParcentage.text = String(Int(sender.value))
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Int(billAmount.text!)!
        let tip = Int(tipParcentage.text!)!
        let people = Int(numOfPeople.text!)!
        let calculateResult = (bill * tip / 100) / people
        tipAmountLabel.text = String("$ \(calculateResult)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmount.delegate = self
        numOfPeople.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: ViewController.keyboardWillShowNotification, object: nil)
      
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: ViewController.keyboardWillHideNotification, object: nil)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            if view.frame.origin.y != 0 {
                view.frame.origin.y += keyboardHeight
            }
            
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardHeight
            }
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        billAmount.resignFirstResponder()
        numOfPeople.resignFirstResponder()
    }
    
}

