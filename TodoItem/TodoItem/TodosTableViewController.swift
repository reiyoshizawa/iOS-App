//
//  TodosTableViewController.swift
//  TodoItem
//
//  Created by yoshizawarei on 2018/10/11.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class TodosTableViewController: UITableViewController {

    var todoList: TodoList = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // how each cell looks like
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItem", for: indexPath)
        
        // checkmark, todoLabel
        if let checkmark = cell.viewWithTag(10) as? UILabel {
            checkmark.text = todoList.todos[indexPath.row].checked ? "✔️" : ""
        }
        
        if let todoLabel = cell.viewWithTag(11) as? UILabel {
            todoLabel.text = todoList.todos[indexPath.row].text
        }
        
        return cell
        
    }
    
    // MARK: TabelViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // get the cell selected
        if let cell = tableView.cellForRow(at: indexPath) {
           let item = todoList.todos[indexPath.row]
           item.toggleCheckmark()
           // uncheck(check) the check mark from the cell
            configureCheckmark(for: cell, with: item)
        }
        // change the checked property of the TodoItem from model
        
        // deselect the row (no-highlighting)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func configureCheckmark(for cell: UITableViewCell, with item: TodoItem) {
        if let checkmark = cell.viewWithTag(10) as? UILabel {
            checkmark.text = item.checked ? "✔️" : ""
        }
    }
    
}
