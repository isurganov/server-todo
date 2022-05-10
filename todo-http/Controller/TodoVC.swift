//
//  ViewController.swift
//  todo-http
//
//  Created by Иван Трубецкой on 10.05.2022.
//

import UIKit

class TodoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var todoitemTxt: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var todoTable: UITableView!
    
    var todos = Array<Todo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTable.delegate = self
        todoTable.dataSource = self
        
        getTodos()
    }
    
    
    func getTodos(){
        NetworkService.shared.gotTodos { (todos) in
            self.todos = todos.items
            self.todoTable.reloadData()
        } onError:
    }

    @IBAction func addToDo(_ sender: Any) {
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as? ToDoCell {
            cell.updateCell(todo: todos[indexPath.row])
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
}

