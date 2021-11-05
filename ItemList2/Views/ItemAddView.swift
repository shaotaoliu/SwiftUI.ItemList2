import SwiftUI

struct ItemAddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var newItem = Item()
    
    var body: some View {
        NavigationView {
            ItemEditView(item: $newItem)
                .navigationTitle("New Item")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: CancelButton, trailing: SaveButton)
        }
    }
    
    var SaveButton: some View {
        Button("Save") {
            ItemListViewModel.shared.add(item: newItem)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var CancelButton: some View {
        Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ItemAddView_Previews: PreviewProvider {
    static var previews: some View {
        ItemAddView()
    }
}
