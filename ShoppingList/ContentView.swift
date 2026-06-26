//
//  ContentView.swift
//  ShoppingList
//
//  Created by Jonathan Heinzman on 6/20/26.
//

import SwiftUI

struct ContentView: View {
    
    // Parent is in charge of owning the data
    @State var tasks: [Task] = [
        Task(title:"Get a fishing license"),
        Task(title:"Buy worms"),
        Task(title:"Go to a pond"),
        Task(title:"Catch a Trout"),
        Task(title:"Catch a Bluegill"),
        Task(title:"Catch a Bass")
    ]
    
    @State private var showAddTaskView = false
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 12){
                    ProgressHeader(tasks: tasks)
                    
                    LazyVStack(spacing: 12){
                        
                        ForEach($tasks) { $task in
                            
                            TaskRow(task: $task) {
                                deleteTask(task)
                            }
                            .transition(
                                .move(edge: .top)
                                .combined(with: .opacity))
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                Button {
                    showAddTaskView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView(tasks: $tasks)
            }
            
        }
    }
    func deleteTask(_ task: Task) {
        withAnimation {
            tasks.removeAll { $0.id == task.id }
        }
    }
}



#Preview {
    ContentView()
}

// Assignment 3
// 1. - Move everything where it belongs
// 2. - Add a form(New View), to add a task
// 3. - Add a Delete button
// 4. - Work on UI and animations
// Extra: How do we add trasitions to views ?
