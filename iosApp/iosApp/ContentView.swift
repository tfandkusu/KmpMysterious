import SwiftUI
import shared

class Collector : Kotlinx_coroutines_coreFlowCollector {
    func emit(value: Any?) async throws {
        print("emit value = \(value)")
    }
}

struct ContentView: View {
	let greet = Greeting().greet()

	var body: some View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
