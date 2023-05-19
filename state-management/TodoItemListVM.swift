//
//  TodoItemListVM.swift
//  state-management
//
//  Created by Admin on 2023-05-19.
//

import Foundation

class TodoItemListVM: ObservableObject {
    
    @Published var todoItems: [TodoItem] = []
    
    
    func loadItems() {
        do {
            self.todoItems = try .fromJSON(named: "TodoItems")
        } catch {
            fatalError("\(error)")
        }
    }
    
    func reorder() {
        todoItems.sort(by: { !$0.isDone && $1.isDone })
    }
}
