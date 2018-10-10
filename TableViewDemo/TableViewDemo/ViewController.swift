//
//  ViewController.swift
//  TableViewDemo
//
//  Created by yoshizawarei on 2018/10/09.
//  Copyright © 2018 rei yoshizawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    static var students = ["Kenta", "Minami", "Marcelo", "Giada", "Nagisa", "Bianca", "Rei", "Alex", "Javiel", "Juan", "Natsumi", "Suelen", "Marla", "Emre E", "Gustavo", "Chin", "Charles", "Emre A"]
    
    static var positions = ["Japan", "Japan", "Brazil", "Italy", "Japan", "Brazil", "Japan", "Korea", "Mexico", "Mexico", "Japan",  "Brazil",  "Brazil", "Turkey", "Brazil", "Thailand", "China", "Turkey"]
    
    
    @IBOutlet weak var myTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Details", let detailVC = segue.destination as? DetailViewController{
            if let cell = sender as? StudentTableViewCell, let indexPath =  myTableView.indexPath(for: cell){
                
                //selected real index
                let selectedIndex = indexPath.row
                detailVC.nameString = ViewController.students[selectedIndex]
                detailVC.positionString = ViewController.positions[selectedIndex]
                
            }
        }
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.students.count
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StudentTableViewCell

        cell.studentName.text = ViewController.students[indexPath.row]
        cell.position.text = ViewController.positions[indexPath.row]
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

