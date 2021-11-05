import SwiftUI

@main
struct ItemList2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
        }
    }
}
