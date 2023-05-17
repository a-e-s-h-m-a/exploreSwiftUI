//
//  TodoItem.swift
//  state-management
//
//  Created by Admin on 2023-05-17.
//

import Foundation

struct TodoItem: Codable, Identifiable {
    let id: UUID
    var title: String
    var description: String?
    var isDone: Bool = false
}
