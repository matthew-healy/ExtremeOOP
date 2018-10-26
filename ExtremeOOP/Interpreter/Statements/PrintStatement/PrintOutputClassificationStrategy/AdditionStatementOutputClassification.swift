final class AdditionStatementOutputClassification: PrintOutputClassificationStrategy {
    weak var context: ProgramContext?
    private let argumentComponents: [String]

    init(argument: String) {
        let substringComponents = argument.split(separator: " ")
        self.argumentComponents = substringComponents.map(String.init)
    }

    func canOutput() -> Bool {
        return argumentComponents.contains("+")
    }

    func output() {
        let output = Output(add())
        context?.output(output)
    }

    private func add() -> String {
        let result = argumentComponents
            .map(Int.init).compactMap { $0 }
            .reduce(0, +)
        return String(result)
    }
}
