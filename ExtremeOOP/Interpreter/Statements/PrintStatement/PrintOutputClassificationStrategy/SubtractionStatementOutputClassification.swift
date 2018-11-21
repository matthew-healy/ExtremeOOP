final class SubtractionStatementOutputClassification: PrintOutputClassificationStrategy {
    weak var context: ProgramContext?
    private let argumentComponents: [String]

    init(argument: String) {
        let substringComponents = argument.split(separator: " ")
        self.argumentComponents = substringComponents.map(String.init)
    }

    func canOutput() -> Bool {
        return argumentComponents.contains("-")
    }

    func output() {
        let output = Output(String(difference()))
        context?.output(output)
    }

    private func difference() -> Int {
        guard
            let firstArgument = argumentComponents.first.flatMap(Int.init),
            let secondArgument = argumentComponents.last.flatMap(Int.init)
        else { return 0 }
        return firstArgument - secondArgument
    }
}
