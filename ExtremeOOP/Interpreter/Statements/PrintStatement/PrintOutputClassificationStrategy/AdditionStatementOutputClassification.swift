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
            .filter { $0 != "+" }
            .map(getArgument)
            .reduce(0, +)
        return String(result)
    }

    func getArgument(from stringValue: String) -> Int {
        if let argument = Int(stringValue) {
            return argument
        }

        return 1
    }
}
