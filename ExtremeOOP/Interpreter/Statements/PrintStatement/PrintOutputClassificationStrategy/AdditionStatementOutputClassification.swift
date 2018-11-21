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
        let result = sum(from: parsersWithContext())
        let output = Output(String(result))
        context?.output(output)
    }

    private func parsersWithContext() -> [AdditionArgumentParser] {
        let parsers = argumentComponents
            .compactMap(AdditionArgumentParser.init)
        parsers.forEach { $0.context = context }
        return parsers
    }

    private func sum(from parsers: [AdditionArgumentParser]) -> Int {
        return parsers
            .map { $0.parse() }
            .reduce(0, +)
    }
}
