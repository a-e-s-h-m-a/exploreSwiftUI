//
//  ContentView.swift
//  state-management
//
//  Created by Admin on 2023-05-17.
//

import SwiftUI

struct TodoItemList: View {
    @StateObject var viewModel = TodoItemListVM()
    
    var body: some View {
        List($viewModel.todoItems) { $todoItem in
            TodoItemRow(todoItem: $todoItem.onNewValue {
                viewModel.reorder()
            })
        }
        .onAppear {
            viewModel.loadItems()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemList()
    }
}
