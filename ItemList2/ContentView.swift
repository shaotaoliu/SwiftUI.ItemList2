import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ItemListViewModel.shared
    @State private var showSheet = false
    @State private var showDeleteConfirmation = false
    @State private var deleteSet: IndexSet? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.items, id: \.id) { item in
                    NavigationLink(destination: ItemView(item: item)) {
                        Text(item.name)
                    }
                }
                .onDelete { offsets in
                    deleteSet = offsets
                    showDeleteConfirmation = true
                }
            }
            .listStyle(.plain)
            .navigationTitle("Items")
            .navigationBarItems(leading: AddButton, trailing: EditButton())
        }
        .confirmationDialog("Confirm", isPresented: $showDeleteConfirmation, actions: {
            Button("Delete") {
                vm.delete(offsets: deleteSet!)
            }
        }, message: {
            Text("Are you sure you want to delete?")
        })
    }
    
    var AddButton: some View {
        Button("Add") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            ItemAddView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
