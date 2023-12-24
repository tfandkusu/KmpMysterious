import ComposableArchitecture
import SwiftUI

struct FlowExpView: View {
    let store: StoreOf<FlowExpReducer>

    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("Count = \(viewStore.count)").padding(16)
                Button(
                    action: {
                        viewStore.send(.countUp)
                    }
                ) {
                    Text("Count += 1")
                }.padding(16)
                Spacer()
            }.navigationBarTitle("Flow 動作確認")
        }
    }
}

// #Preview {
//    FlowExpView()
// }
