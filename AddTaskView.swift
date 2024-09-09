import SwiftUI

struct AddTaskView: View {
    @Binding var tasks: [ToDoItem]
    @State private var newTaskTitle = ""
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            TextField("Enter new task title", text: $newTaskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            HStack {
                Button(action: {
                    isShowing = false
                }) {
                    Text("Cancel")
                }
                .padding()
                
                Button(action: addTask) {
                    Text("Save")
                }
                .padding()
            }
        }
        .padding()
    }
    
    private func addTask() {
        if !newTaskTitle.isEmpty {
            let newTask = ToDoItem(title: newTaskTitle)
            tasks.append(newTask)
            newTaskTitle = ""
            isShowing = false
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(tasks: .constant([]), isShowing: .constant(true))
    }
}
