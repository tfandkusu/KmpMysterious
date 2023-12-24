import ComposableArchitecture
import shared

class Collector: Kotlinx_coroutines_coreFlowCollector {
    func emit(value: Any?) async throws {
        print("emit value = \(value)")
    }
}

@Reducer
struct FlowExpReducer {
    struct State: Equatable {
        var count = 0
    }

    enum Action {
        case countUp
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .countUp:
                state.count += 1
                return .none
            }
        }
    }
}
