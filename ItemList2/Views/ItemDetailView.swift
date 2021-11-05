import SwiftUI

struct ItemDetailView: View {
    var item: Item
    
    var body: some View {
        VStack {
            Form {
                Text(item.name)
                Text(item.description)
            }
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: Item(name: "Example", description: "This is an example"))
    }
}
