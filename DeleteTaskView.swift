import SwiftUI

struct DeleteTaskView: View {
    @Binding var task: ToDoItem
    @Binding var isShowing: Bool
    var deleteAction: () -> Void
    
    var body: some View {
        VStack {
            Text("Are you sure you want to delete \"\(task.title)\"?")
                .padding()
            
            HStack {
                Button("Cancel") {
                    isShowing = false
                }
                .padding()
                
                Button("Delete") {
                    deleteAction()
                    isShowing = false
                }
                .padding()
                .foregroundColor(.red)
            }
        }
        .padding()
    }
}

struct DeleteTaskView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteTaskView(task: .constant(ToDoItem(title: "Sample Task")), isShowing: .constant(true), deleteAction: {})
    }
}
