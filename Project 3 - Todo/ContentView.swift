import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State private var page: RemindersPage = RemindersPage( title: "Todo", items: [
        Reminder(title: "First Task ")
    ], color: .red)
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isEditing.toggle()
                }) {
                    Text(page.title)
                    Spacer()
                    Image(systemName: "info.circle")
                        .font(.system(size: 30))
                }
                .foregroundColor(page.color)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
                
            }
            
            List {
                // TODO: Loop through the page's reminders using ForEach
                ForEach($page.items) { $reminder in
                    HStack {
                        Button(action: {
                            reminder.isCompleted.toggle()
                        }) {
                            Image(systemName: reminder.isCompleted ? "circle.fill" : "circle").foregroundColor(page.color)
                        }
                        TextField("Reminder", text: $reminder.title).foregroundStyle(reminder.isCompleted ? .secondary : .primary)
                        
                    }.font(.title)
                    
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            HStack {
                Spacer()
                Button(action: {
                    page.items.append(Reminder(title: ""))
                    
                }) {
                    Image(systemName: "plus.circle.fill").foregroundColor(page.color)
                        .font(.system(size: 50))
                        .padding([.trailing])
                }
                
            }

        }
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
            EditSheet(title: $page.title, selectedColor: $page.color, isEditing: $isEditing)
        }
    }
}

#Preview {
    ContentView()
}

