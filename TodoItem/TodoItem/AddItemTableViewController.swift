//
//  AddItemTableViewController.swift
//  TodoItem
//
//  Created by yoshizawarei on 2018/10/11.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemCancel()
    func addItemDidFinishAdding(_ item: TodoItem)
    func addItemDidFinishEditing(_ item: TodoItem)
}

class AddItemTableViewController: UITableViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    weak var delegate: AddItemViewControllerDelegate?
    weak var itemToEdit: TodoItem?
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.addItemCancel()
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if let item = itemToEdit, let text = textField.text {
            item.text = text
            delegate?.addItemDidFinishEditing(item)
        } else {
            if let text = textField.text {
                let newItem = TodoItem()
                newItem.text = text
                newItem.checked = false
                delegate?.addItemDidFinishAdding(newItem)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        if let item = itemToEdit {
            title = "Edit Todo Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
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
