import ComposableArchitecture
import shared

@Reducer
struct FlowExpReducer {
    struct State: Equatable {
        var count = 0
    }

    enum Action {
        case onAppear
        // Count Up ボタンが押されたときに呼ばれる
        case countUp
        // 表示カウントを更新する
        case updateCount(count: Int)
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { send in
                    class Collector: Kotlinx_coroutines_coreFlowCollector {
                        let sendTask: (Int) async -> Void

                        init(sendTask: @escaping (Int) async -> Void) {
                            self.sendTask = sendTask
                        }

                        func emit(value: Any?) async throws {
                            if let intValue = value as! Int? {
                                await self.sendTask(intValue)
                            }
                        }
                    }
                    let collector = Collector(
                        sendTask: { intValue in
                            await send(.updateCount(count: intValue))
                        }
                    )
                    // Flow の collect メソッドは Suspend function なので、ここでクラッシュする
                    try await ExampleKt.getExampleFlow().collect(collector: collector)
                }
            case .countUp:
                ExampleKt.countUpExampleFlowValue()
                return .none
            case let .updateCount(count: count):
                state.count = count
                return .none
            }
        }
    }
}
