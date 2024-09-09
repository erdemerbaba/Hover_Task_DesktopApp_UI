import SwiftUI

struct EditTaskView: View {
    @Binding var task: ToDoItem
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            TextField("Edit Task", text: $task.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                isShowing = false
            }) {
                Text("Save")
            }
            .padding()
        }
        .padding()
    }
}

struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        EditTaskView(task: .constant(ToDoItem(title: "Sample Task")), isShowing: .constant(true))
    }
}
