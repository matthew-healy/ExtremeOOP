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
        guard
            let firstValue = Int(argumentComponents.first ?? "0"),
            let secondValue = Int(argumentComponents.last ?? "0")
        else { return "" }

        return String(firstValue + secondValue)
    }
}
