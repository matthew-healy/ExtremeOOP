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
        let arguments = argumentComponents.compactMap(Int.init)
        guard let head = arguments.first else { return 0 }
        if arguments.count == 1 {
            return 1
        }
        return arguments.dropFirst().reduce(head, -)
    }
}
