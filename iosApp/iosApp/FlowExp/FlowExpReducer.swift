import ComposableArchitecture

@Reducer
struct FlowExpReducer {
    struct State: Equatable {
        var count: Int
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
