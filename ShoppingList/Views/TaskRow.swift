//
//  TaskRow.swift
//  ShoppingList
//
//  Created by Jonathan Heinzman on 6/22/26.
//

import SwiftUI

struct TaskRow:View {
    
    @Binding var task: Task
    let deleteAction: () -> Void
    
    var body: some View {
        
        HStack(spacing: 12){
            
            Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isDone ? .green : .secondary)
                .font(.title2)
                .disabled(task.isDone)
            
            Text(task.title)
                .font(.body)
                .strikethrough(task.isDone, color: .red)
                .opacity(task.isDone ? 0.3 : 1.0)
                .animation(.easeInOut(duration: 0.25), value: task.isDone)
            
            
            Spacer()
            
            Button {
                deleteAction()
            } label: {
                Image(systemName: "trash")
                    .foregroundStyle(.red)
            }
            
        }
        .padding()
        
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
        
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)) {
                task.isDone.toggle()
            }
        }
    }
}

//#Preview {
//    TaskRow()
//}
