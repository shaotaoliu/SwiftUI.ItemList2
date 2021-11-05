# SwiftUI.ItemList2

This app is similar to SwiftUI.ItemList but uses a different implementation.

When the app starts, it displays a list of items.

![image](https://user-images.githubusercontent.com/15805568/140473435-b13cb68c-9663-49ec-a31d-06fed7a9cbe8.png)

Tapping the Edit button will enter the Edit mode. You can delete any item, and a confirmation dialog shows before you delete it.

![image](https://user-images.githubusercontent.com/15805568/140473676-c0372d8b-7b1a-471d-ac57-52f07122a784.png)

Tapping the Add button shows the Add Item screen. Since we are creating a new item, no arguments are passed.

```swift
        Button("Add") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            ItemAddView()
        }
```

![image](https://user-images.githubusercontent.com/15805568/140474084-9b129411-5abc-4bdf-927d-a027b198ba24.png)

In the ItemAddView.swift file, since it uses a sheet, it can have its own NavigationView. A new Item is created and passed to ItemEditView using Binding.

```swift
    @State var newItem = Item()
    
    var body: some View {
        NavigationView {
            ItemEditView(item: $newItem)
                .navigationTitle("New Item")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: CancelButton, trailing: SaveButton)
        }
    }
```

Tapping on an item row in the list of the main screen will open the item detail screen. The selected item is passed as value type.

```swift
ItemView(item: item)
```

![image](https://user-images.githubusercontent.com/15805568/140474724-503538bc-ed07-4c9d-b019-f91b897b39c4.png)

Tapping the Edit button will show the ItemEditView.

![image](https://user-images.githubusercontent.com/15805568/140474991-9ce02796-dc2f-4952-88c2-ca87668169d0.png)

Both ItemDetailView and ItemEditView are embeded in the ItemView, depending on the viewMode variable. Since ItemView is already in the navigation stack, don't use NavigationView again.

```swift
        if viewMode {
            ItemDetailView(item: item)
        }
        else {
            ItemEditView(item: $editingItem)
        }
        
        ...
        
        Button("Edit") {
            editingItem = item
            viewMode = false
        }
        
        Button("Save") {
            // save editingItem
            item = editingItem
            viewMode = true
        }
```

A value of item is passed to ItemDetailView because it is not modified. A binding of item is passed to ItemEditView because it will be changed. 
1. When the Edit button is tapped, the value of item is coped to editingItem.
2. If the Save button is tapped later, the value of editingItem is copied back to item.
3. If the Cancel button is tapped, its value is just discarded.

The ItemEditView is shared by ItemAddView and ItemView in order to reduce redundant code. It only defines the view interface. The functions are implemented in ItemAddView and ItemView.
