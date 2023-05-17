//
//  ContentView.swift
//  state-management
//
//  Created by Admin on 2023-05-17.
//

import SwiftUI

struct ContentView: View {
    @State var todoItems: [TodoItem] = (try? .fromJSON(named: "TodoItems")) ?? []
    
    var body: some View {
        List($todoItems) { $todoItem in
            TodoItemRow(todoItem: $todoItem)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
