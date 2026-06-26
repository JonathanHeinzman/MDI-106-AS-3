//
//  AddTaskView.swift
//  ShoppingList
//
//  Created by Jonathan Heinzman on 6/22/26.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var tasks: [Task]
    
    @State private var title = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("New Task") {
                    TextField("Enter task title", text: $title)
                }
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        withAnimation {
                            tasks.append(Task(title: title))
                        }
                        dismiss()
                    }
                    .foregroundStyle (title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? .gray : .blue)
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines) .isEmpty)
                }
            }
        }
    }
}

//#Preview {
//    AddTaskView()
//}
