
import SwiftUI

struct ContentView: View {
    @State private var fruits: [FruitData] = [
        FruitData(name: "リンゴ", isCheck: false),
        FruitData(name: "ミカン", isCheck: true),
        FruitData(name: "パイナップル", isCheck: false),
        FruitData(name: "バナナ", isCheck: true)
    ]
    @State private var isAddView = false
    
    var body: some View {
        NavigationStack {
            List($fruits) { fruit in
                FruitsListView(fruit: fruit)
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
                    fruits.append(FruitData(name: name, isCheck: false))
                    isAddView = false
                },
                cancel: {
                    isAddView = false
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
