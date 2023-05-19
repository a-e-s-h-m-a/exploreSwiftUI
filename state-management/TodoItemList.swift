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
        NavigationView {
            List {
                ForEach($viewModel.todoItems) { $todoItem in
                    TodoItemRow(todoItem: $todoItem.onNewValue {
                        viewModel.reorder()
                    })
                }
                .onDelete(perform: viewModel.deleteItems(at:))
                .onMove(perform: viewModel.moveItems(from:to:))
            }
            .listStyle(.plain)
            .navigationTitle("Today's tasks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .onAppear {
                viewModel.loadItems()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoItemList()
    }
}
