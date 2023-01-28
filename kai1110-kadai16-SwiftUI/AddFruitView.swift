
import SwiftUI

struct AddFruitView: View {
    let save: (String) -> Void
    let cancel: () -> Void
    @State private var newFruitName = ""
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("名前")
                TextField("", text: $newFruitName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        save(newFruitName)
                    }) {
                        Text("save")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        cancel()
                    }) {
                        Text("cancel")
                    }
                }
            }
        }
    }
}

struct AddFruitView_Previews: PreviewProvider {
    static var previews: some View {
        AddFruitView(save: { _ in }, cancel: {})
    }
}
