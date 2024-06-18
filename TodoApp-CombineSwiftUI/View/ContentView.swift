//
//  ContentView.swift
//  TodoApp-CombineSwiftUI
//
//  Created by Negin Zahedi on 2024-06-18.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = TaskListViewModel.shared
    @State private var showAddTaskView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Tasks")
                .font(.largeTitle)
                .padding()
            List{
                ForEach(vm.tasks.value, id: \.self){ task in
                    Text(task)
                }
            }
            Button {
                showAddTaskView.toggle()
            } label: {
                Text("Add New")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
        }
        
        .sheet(isPresented: $showAddTaskView, content: {
            AddTaskView(vm: vm)
        })
    }
}

#Preview {
    ContentView()
}
