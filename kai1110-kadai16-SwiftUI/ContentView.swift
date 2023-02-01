
import SwiftUI

struct ContentView: View {
    @State private var fruits: [FruitData] = [
        FruitData(name: "リンゴ", isCheck: false, deleteCheck: true),
        FruitData(name: "ミカン", isCheck: true, deleteCheck: true),
        FruitData(name: "パイナップル", isCheck: false, deleteCheck: true),
        FruitData(name: "バナナ", isCheck: true, deleteCheck: true)
    ]
    @State private var isAddView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($fruits) { fruit in
                    ListItemView(fruit: fruit, delete: delete)
                }
            }
            .listStyle(InsetListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $isAddView) {
            AddFruitView(
                save: { name in
                    fruits.append(FruitData(name: name, isCheck: false, deleteCheck: true))
                    isAddView = false
                },
                cancel: {
                    isAddView = false
                }
            )
        }
    }
    //deleteCheckがtrueの以外の要素をフィルタリング
    func delete() {
        let necessaryFruit = self.fruits.filter({$0.deleteCheck})
        self.fruits = necessaryFruit
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
