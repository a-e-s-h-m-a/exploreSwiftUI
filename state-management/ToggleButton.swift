//
//  ToggleButton.swift
//  state-management
//
//  Created by Admin on 2023-05-17.
//

import SwiftUI

struct ToggleButton: View {
    
    @Binding var state: Bool
    
    var body: some View {
        Button {
            withAnimation {
                state.toggle()
            }
        } label: {
            GeometryReader { proxy in
                ZStack {
                    Circle()
                        .stroke(lineWidth: 2.0)
                        .foregroundColor(.blue)
                    
                    if state {
                        Circle()
                            .frame(width: proxy.size.width * 0.8)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .scaledToFit()
    }
}

struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        StatefulPreviewWrapper(true) { state in
            ToggleButton(state: state)
                .previewLayout(.fixed(width: 100, height: 100))
        }
    }
}
