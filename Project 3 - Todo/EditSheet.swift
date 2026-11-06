//
//  EditSheet.swift
//  MyApp
//
//  Created by Z on 11/5/26.
//
import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var title: String
    @Binding var selectedColor: Color
    @Binding var isEditing: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                            Image(systemName: "list.bullet.circle.fill")
                                .foregroundStyle(selectedColor)
                Text("List Name").font(.headline)
                Spacer()
               
                    }

            TextField("Title", text: $title).font(.title).background(Color.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 16)).onSubmit {
                isEditing.toggle()
            }
            
            ColorChooser(selectedColor: $selectedColor)
               
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
    @Previewable @State   var selectedColor: Color = .red
    @Previewable @State  var title: String = "To Do"
    @Previewable @State  var isEditing: Bool = true
    EditSheet(title: $title, selectedColor: $selectedColor, isEditing: $isEditing)
        .preferredColorScheme(.dark)
}
