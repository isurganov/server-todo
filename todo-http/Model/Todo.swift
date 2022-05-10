//
//  Todo.swift
//  todo-http
//
//  Created by Иван Трубецкой on 10.05.2022.
//

import Foundation

struct Todos: Codable {
    let items: Array<Todo>
}

struct Todo: Codable {
    let item: String
    let priority: Int
    
}
