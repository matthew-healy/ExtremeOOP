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
        let result = multiply()
        let output = Output(String(result))
        context?.output(output)
    }

    private func multiply() -> Int {
        return argumentComponents
            .compactMap(Int.init)
            .reduce(1, *)
    }
}
