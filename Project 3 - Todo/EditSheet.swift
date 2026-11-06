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
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                            Image(systemName: "list.bullet.circle.fill")
                                .foregroundStyle(selectedColor)
                            Text(title)
                        }
                        ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}

#Preview {
   // @Previewable @State   var selectedColor: Color = .red
  //  @Previewable @State  var title: String = "To Do"
  //  EditSheet(title: $title, selectedColor: $selectedColor)
  //      .preferredColorScheme(.dark)
}
