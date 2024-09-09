import SwiftUI

struct ContentView: View {
    @State private var tasks: [ToDoItem] = []
    @State private var newTaskTitle = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter a new task", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: addTask) {
                    Text("Add")
                }
                .padding()
            }
            
            ToDoListView(tasks: $tasks)
        }
        .padding()
    }
    
    private func addTask() {
        if !newTaskTitle.isEmpty {
            let newTask = ToDoItem(title: newTaskTitle)
            tasks.append(newTask)
            newTaskTitle = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
