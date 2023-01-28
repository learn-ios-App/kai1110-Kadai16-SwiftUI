
import SwiftUI

struct FruitsListView: View {
    @Binding var fruit: FruitData
    @State private var isEditView = false
    var body: some View {
        HStack {
            Button(action: {
                fruit.isCheck.toggle()
            }) {
                Image(
                    systemName: fruit.isCheck
                    ? "checkmark.circle"
                    : "circle"
                )
            }
            Text(fruit.name)
            Spacer()
            Button(action: {
                isEditView = true
            }) {
                Image(systemName: "i.circle")
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .sheet(isPresented: $isEditView) {
            EditView(
                text: fruit.name,
                //編集内容を反映させて戻る
                edit: { text in
                    self.fruit.name = text
                    isEditView = false
                },
                //編集内容を反映させずに戻る
                cancel: {
                    isEditView = false
                }
            )
        }
    }
}

//PreView用の中間的なViewを作る。
private struct Preview: View {
    @State var friut = FruitData(name: "りんご", isCheck: false)
    
    var body: some View {
        FruitsListView(fruit: $friut)
    }
}

struct FruitsListView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
