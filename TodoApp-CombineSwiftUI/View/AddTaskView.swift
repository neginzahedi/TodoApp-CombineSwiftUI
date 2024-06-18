//
//  AddTaskView.swift
//  TodoApp-CombineSwiftUI
//
//  Created by Negin Zahedi on 2024-06-18.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject var vm : TaskListViewModel
    
    @State private var text: String = ""
    
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack(spacing: 50){
            Text("Add New Task")
                .font(.title)
            
            TextField("Placeholder", text: $text)
                .textFieldStyle(.roundedBorder)
            HStack(spacing: 50){
                Button("Cancel") {
                    presentation.wrappedValue.dismiss()
                }
                .foregroundColor(.pink)
                
                Button("Done"){
                    vm.addNewTask.send(text)
                    presentation.wrappedValue.dismiss()
                }
                
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    AddTaskView(vm: TaskListViewModel())
}
