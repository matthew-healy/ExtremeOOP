final class MultiplicationOutputClassification: PrintOutputClassificationStrategy {
    var context: ProgramContext?
    private let argumentComponents: [String]

    init(argument: String) {
        let substringComponents = argument.split(separator: " ")
        self.argumentComponents = substringComponents.map(String.init)
    }

    func canOutput() -> Bool {
        return argumentComponents.contains("*")
    }

    func output() {
        guard
            let firstArg = argumentComponents.first.flatMap(Int.init),
            let secondArg = argumentComponents.last.flatMap(Int.init)
        else { return }
        let result = firstArg * secondArg
        let output = Output(String(result))
        context?.output(output)
    }
}
