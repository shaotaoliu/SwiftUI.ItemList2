import SwiftUI

struct ItemView: View {
    @State private var viewMode = true
    @State private var editingItem: Item
    @State var item: Item
    
    init(item: Item) {
        self.item = item
        self.editingItem = item
    }
    
    var body: some View {
        if viewMode {
            ItemDetailView(item: item)
                .navigationTitle("Item Detail")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: EditButton)
            
        }
        else {
            ItemEditView(item: $editingItem)
                .navigationTitle("Edit Item")
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: CancelButton, trailing: SaveButton)
        }
    }
    
    var SaveButton: some View {
        Button("Save") {
            ItemListViewModel.shared.update(item: editingItem)
            item = editingItem
            viewMode = true
        }
    }
    
    var CancelButton: some View {
        Button("Cancel") {
            viewMode = true
        }
    }
    
    var EditButton: some View {
        Button("Edit") {
            editingItem = item
            viewMode = false
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: ItemListViewModel.shared.items[0])
    }
}
