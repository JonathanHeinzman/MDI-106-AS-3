//
//  Task.swift
//  ShoppingList
//
//  Created by Jonathan Heinzman on 6/20/26.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    let id: UUID = UUID()
    let title: String
    let isDone: Bool
}
