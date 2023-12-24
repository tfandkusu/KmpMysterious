import ComposableArchitecture
import shared
import SwiftUI

struct ContentView: View {
    let greet = Greeting().greet()

    var body: some View {
        NavigationView {
            VStack {
                Text(greet).onAppear(perform: {
                    print("onApper")
                    let hoge1 = FooHoge(
                        id: 1,
                        name: "foo"
                    )
                    let hoge2 = BarHoge(
                        id: 2,
                        name: "bar"
                    )
                    let hoge3 = QuxHoge(
                        id: 2,
                        name: "bar"
                    )
                    let c = A.BC(
                        id: 1,
                        name: "abc"
                    )
                    HogeKt.printFooHoge(hoge: hoge1)
                    HogeKt.printBarHoge(hoge: hoge2)
                    let e = DE()
                    let flow = ExampleKt.getExampleFlow()
                    let collector = Collector()
                })
                NavigationLink(
                    destination: FlowExpView(
                        store: Store(initialState: FlowExpReducer.State()) {
                            FlowExpReducer()
                        }
                    ),
                    label: {
                        Text("Flow 動作確認")
                    }
                ).padding(8)
                Spacer()
            }.navigationBarTitle("最初の画面")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
