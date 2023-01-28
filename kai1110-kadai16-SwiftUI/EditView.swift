
import SwiftUI

struct EditView: View {
    @State var text: String
    let edit: (String) -> Void
    let cancel: () -> Void
    var body: some View {
        NavigationStack {
            HStack {
                Text("名前")
                TextField("", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        edit(text)
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

private struct Preview: View {
    @State private var sampleText = "りんご"
    var body: some View {
        EditView(text: sampleText, edit: { _ in }, cancel: {})
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
