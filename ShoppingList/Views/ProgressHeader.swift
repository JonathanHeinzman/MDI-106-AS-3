//
//  ProgressHeader.swift
//  ShoppingList
//
//  Created by Jonathan Heinzman on 6/22/26.
//

import SwiftUI

struct ProgressHeader:View {
    
    // value -> total amount of items
    // progress -> how many are completed
    let tasks: [Task]
    
    // Computed Properties
    // A compute property does not store data. Instead it claculates and returns a value whenever it is accessed.
    var doneCount: Int {
        
    
        tasks.filter{ $0.isDone }.count
        
        
    }
    
    var body: some View {
    
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text("My Tasks")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Text("\(doneCount) / \(tasks.count)").foregroundStyle(.secondary)
                
            }
            
            ProgressView(
                value: Double(doneCount),
                total: Double(tasks.count))
            .tint(.green)
            .animation(.easeInOut, value: doneCount)
            
        }.padding()
    }
}

//#Preview {
//    ProgressHeader()
//}
