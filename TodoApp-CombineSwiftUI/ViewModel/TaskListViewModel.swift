//
//  TaskListViewModel.swift
//  TodoApp-CombineSwiftUI
//
//  Created by Negin Zahedi on 2024-06-18.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    
    static let shared = TaskListViewModel()
    
    let tasks = CurrentValueSubject<[String],Never>(["Buy Orange Juice"])
    
    var addNewTask = PassthroughSubject<String,Never>()
    
    var subscriptions = Set<AnyCancellable>()
    
    init(){
        
        addNewTask
            .filter({$0.count > 3})
            .sink { _ in
                
            } receiveValue: { [unowned self] newTask in
                self.tasks.send(self.tasks.value + [newTask])
            }
            .store(in: &subscriptions)
        
        tasks
            .sink {[unowned self] (values) in
                print("tasks were updated to \(values)")
                self.objectWillChange.send()
            }
            .store(in: &subscriptions)
    }
}
