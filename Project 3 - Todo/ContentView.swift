import SwiftUI
import Playgrounds

struct ContentView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State private var page: RemindersPage = RemindersPage( title: "Todo", items: [
    ], color: .red)
    
    var body: some View {
        VStack {
            HStack {
                Text(page.title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(page.color)
                    .padding()
                Spacer()
            }
            
            List {
                // TODO: Loop through the page's reminders using ForEach
                ForEach($page.items) { $reminder in
                    // TODO: Display each reminder row
                     
                    TextField("Reminder", text: $reminder.title)
                }
                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            
            HStack {
                Spacer()
                Button(action: {
                    page.items.append(Reminder(title: "New task"))
                }) {
                    Image(systemName: "plus.circle.fill").foregroundColor(page.color)
                        .font(.system(size: 50))
                        .padding([.trailing])
                }
                
            }

        }
        .sheet(isPresented: $isEditing) {
            // TODO: Add remaining binding
            EditSheet(title: $page.title, selectedColor: $page.color)
        }
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
