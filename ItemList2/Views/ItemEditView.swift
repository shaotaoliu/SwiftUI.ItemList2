import SwiftUI

struct ItemEditView: View {
    @Binding var item: Item
    
    var body: some View {
        VStack {
            Form {
                TextField("Name", text: $item.name)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Description", text: $item.description)
                    .textFieldStyle(.roundedBorder)
            }
        }
    }
}

struct ItemEditView_Previews: PreviewProvider {
    static var previews: some View {
        ItemEditView(item: .constant(Item(name: "Example", description: "This is an example")))
    }
}
