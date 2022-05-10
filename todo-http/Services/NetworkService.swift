//
//  NetworkService.swift
//  todo-http
//
//  Created by Иван Трубецкой on 10.05.2022.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    let URL_BASE = "http://localhost:3003"
    let URL_ADD_TODO = "/add"
    
    let session = URLSession(configuration: .default)
    func gotTodos(onSuccess: @escaping (Todos) -> Void, onError: @escaping (String) -> Void) {
        let url = URL(string: "\(URL_BASE)")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
            }
            
            if let error = error {
                debugPrint(error.localizedDescription)
                return
            }
            
            guard let  data = data, let response = response as? HTTPURLResponse else {
                debugPrint("Invalud data or response")
                return
            }
            
            do {
                if response.statusCode == 200 {
                    let items = try JSONDecoder().decode(Todos.self, from: data)
                    onSuccess(items)
                } else {
                    let err = try JSONDecoder().decode(APIError.self, from: data)
                }
            } catch {
                onError(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func addTodo(todo: Todo) {
        
    }
}
