//
//  AddItemTableViewController.swift
//  TodoItem
//
//  Created by yoshizawarei on 2018/10/11.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}

extension AddItemTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Optioninning
//        if let text = textField.text {
//            print(text)
//        }
        // Unwrapping Optionals
        // 1. if-let
        // 2. guerd
        guard let oldText = textField.text, let stringRange = Range(range, in: oldText) else { return false }

        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        doneBarButton.isEnabled = newText.isEmpty ? false : true
        return true
    }
}
