import SwiftUI

struct ToDoListView: View {
    @Binding var tasks: [ToDoItem]
    @State private var editingTaskID: UUID? = nil
    
    var body: some View {
        ZStack {
            // Background color of the entire list
            Color.black.edgesIgnoringSafeArea(.all)
            
            List {
                ForEach($tasks) { $task in
                    HStack {
                        if editingTaskID == task.id {
                            TextField("Edit Task", text: $task.title)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .background(Color.white) // Text field background
                                .cornerRadius(8)
                                .padding(.vertical, 4)
                            
                            Button(action: {
                                saveTask()
                            }) {
                                Text("Save")
                                    .foregroundColor(.green)
                                    .padding(.horizontal, 8) // Add padding around the Save button
                                    .background(Color.white) // White background for the Save button
                                    .cornerRadius(8)
                            }
                        } else {
                            Text(task.title)
                                .foregroundColor(.black) // Text color for tasks
                            Spacer()
                            
                            Button(action: {
                                startEditing(task: task)
                            }) {
                                Text("Edit")
                                    .foregroundColor(.blue)
                            }
                            
                            Button(action: {
                                deleteTask(task)
                            }) {
                                Text("Delete")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    .padding() // Padding around content inside each task
                    .background(Color.white) // Background color for each task
                    .cornerRadius(10) // Rounded corners for each item
                    .padding(.vertical, 8) // Padding between each task item
                    .listRowInsets(EdgeInsets()) // Remove default padding
                }
            }
            .scrollContentBackground(.hidden) // Remove default list background
        }
    }
    
    private func startEditing(task: ToDoItem) {
        editingTaskID = task.id
    }
    
    private func saveTask() {
        editingTaskID = nil
    }
    
    private func deleteTask(_ task: ToDoItem) {
        tasks.removeAll { $0.id == task.id }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(tasks: .constant([ToDoItem(title: "Sample Task")]))
    }
}
