//
//  TodosTableViewController.swift
//  TodoItem
//
//  Created by yoshizawarei on 2018/10/11.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class TodosTableViewController: UITableViewController {
    
    var todoList : TodoList = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    // Todo: Fix
    @IBAction func deleteTodoItems(_ sender: UIBarButtonItem) {
        // check if there are any items selected
        if var selectedRows = tableView.indexPathsForSelectedRows {
            selectedRows.sort { $0.row > $1.row }
            for indexPath in selectedRows {
                if let priority = priorityForSectionIndex(indexPath.section) {
                    let priorityTodos = todoList.todoList(for: priority)
//                    let rowToDelete = indexPath.row > priorityTodos.count - 1 ? priorityTodos.count - 1 : indexPath.row
                    let item = priorityTodos[indexPath.row]
                    todoList.remove(item: item, from: priority, at: indexPath.row)
                }
            }
            
            // remove from tableview
            tableView.beginUpdates()
            tableView.deleteRows(at: selectedRows, with: .automatic)
            tableView.endUpdates()
        }
        
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItemSegue"{
            if let addItemVC = segue.destination as? AddItemTableViewController{
                addItemVC.delegate = self
            }
        }else if segue.identifier == "EditItemSegue"{
            if let addItemVC = segue.destination as? AddItemTableViewController{
                if let cell = sender as? UITableViewCell,
                    let indexPath = tableView.indexPath(for:cell),
                    let priority = priorityForSectionIndex(indexPath.section) {
                    let item = todoList.todoList(for: priority)[indexPath.row]
                    addItemVC.itemToEdit = item
                    addItemVC.delegate = self
                }
            }
        }
    }
    
    private func priorityForSectionIndex(_ index: Int) -> TodoList.Priority? {
        return TodoList.Priority(rawValue: index)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return TodoList.Priority.allCases.count
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        if let priority = priorityForSectionIndex(section) {
            return todoList.todoList(for: priority).count
        }
        return 0
    }
    
    // How each cell looks like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItem", for: indexPath)
        // checkmark, todolabel
        if let priority = priorityForSectionIndex(indexPath.section) {
                let items = todoList.todoList(for: priority)
                let item = items[indexPath.row]
                configureCheckmark(for: cell, with: item)
                configureTodoLabel(for: cell, with: item)
            }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String? = nil
        if let priority = priorityForSectionIndex(section) {
            switch priority {
                case .high:
                    title = "High Priority"
                case .medium:
                    title = "Medium Priority"
                case .low:
                    title = "Low Priority"
            }
        }
        return title
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing {
            return
        }
        // get the cell I selected
        if let cell = tableView.cellForRow(at: indexPath) as? TodoTableViewCell{
            //        change the property of the todo Item at from my model
            if let priority = priorityForSectionIndex(indexPath.section) {
                let items = todoList.todoList(for: priority)
                let item = items[indexPath.row]
                item.toggleCheckmark()
                //            uncheck the check mark from the cell
                configureCheckmark(for: cell, with: item)
                // make it deselected(no hightlighting grey)
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    
    func configureCheckmark(for cell : UITableViewCell, with item : TodoItem) {
        if let cell = cell as? TodoTableViewCell{
            cell.checkmark.text = item.checked ? "✓" : ""
            
        }
    }
    func configureTodoLabel(for cell : UITableViewCell, with item : TodoItem) {
        if let cell = cell as? TodoTableViewCell{
            cell.todoLabel.text = item.text
            
        }
    }
    
    //Able to swipe, delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //remove from the model
        if let priority = priorityForSectionIndex(indexPath.section) {
            let item = todoList.todoList(for: priority)[indexPath.row]
            todoList.remove(item: item, from: priority, at: indexPath.row)
            //update to tableview
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // TODO: FIX
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // change model
        if let srcPriority = priorityForSectionIndex(sourceIndexPath.section),
            let destPriority = priorityForSectionIndex(destinationIndexPath.section) {
            
            let item = todoList.todoList(for: srcPriority)[sourceIndexPath.row]
            todoList.move(item: item, from: srcPriority, at: sourceIndexPath, to: destPriority, at: destinationIndexPath)
        }
        
        // update tableview
        tableView.reloadData() // calls datasource methods again
    }
    
}


extension TodosTableViewController: AddItemViewControllerDelegate{
    
    func addItemDidCancel(){
        navigationController?.popViewController(animated: true)
    }
    func addItemDidFinishAdding(_ item: TodoItem){
        navigationController?.popViewController(animated: true)
        
        // update model
        todoList.addTodo(item: item, for: .medium)
        
        // update tabview
        let index = todoList.todoList(for: .medium).count - 1
        let indexPath = IndexPath(row: index, section: TodoList.Priority.medium.rawValue)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func addItemDidFinishEditing(_ item: TodoItem){
        // what is the index of "item" from todos array
        //update model
        for priority in TodoList.Priority.allCases {
            var priorityArray = todoList.todoList(for: priority)
            if let index = priorityArray.index(of: item) {
                priorityArray[index] = item
                let indexPath = IndexPath(row: index, section: priority.rawValue)
                if let cell = tableView.cellForRow(at: indexPath) {
                    configureTodoLabel(for: cell, with: item)
                }
            }
        }
        
        if let index = todoList.todos.index(of: item){
            todoList.todos[index] = item
            //update tableview
            let indexPath = IndexPath(row: index, section: 0)
            
            if let cell = tableView.cellForRow(at: indexPath) as? TodoTableViewCell{
                configureTodoLabel(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}
