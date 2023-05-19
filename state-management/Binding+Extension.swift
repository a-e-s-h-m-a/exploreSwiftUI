//
//  Binding+Extension.swift
//  state-management
//
//  Created by Admin on 2023-05-19.
//

import SwiftUI

extension Binding {
    func onNewValue(_ sideEffect: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { wrappedValue },
            set: {
                wrappedValue = $0
                sideEffect()
            }
        )
    }
}
