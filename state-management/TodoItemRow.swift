//
//  TodoItemRow.swift
//  state-management
//
//  Created by Admin on 2023-05-17.
//

import SwiftUI

struct TodoItemRow: View {
    @Binding var todoItem: TodoItem
    
    var body: some View {
        HStack {
            ToggleButton(state: $todoItem.isDone)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(todoItem.title)
                    .font(.headline)
                    .strikethrough(todoItem.isDone)
                if let description = todoItem.description {
                    Text(description)
                        .font(.subheadline)
                        .strikethrough(todoItem.isDone)
                }
            }
            .padding(.leading)
            Spacer()
        }
        .padding()
//        .frame(height: 70)
    }
}

struct TodoItemRow_Previews: PreviewProvider {
    static let todoItemWithoutDescription = TodoItem(
        id: UUID(),
        title: "Buy some bread 🥖",
        isDone: true
    )
    
    static let todoItemWithDescription = TodoItem(
        id: UUID(),
        title: "Buy some milk 🥛",
        description: "Get a lactos free one",
        isDone: true
    )
    
    static var previews: some View {
        Group {
            TodoItemRow(todoItem: .constant(todoItemWithoutDescription))
                .previewDisplayName("Without description")
            
            StatefulPreviewWrapper(todoItemWithDescription) { todoItem in
                TodoItemRow(todoItem: todoItem)
            }
            .previewDisplayName("With description")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
