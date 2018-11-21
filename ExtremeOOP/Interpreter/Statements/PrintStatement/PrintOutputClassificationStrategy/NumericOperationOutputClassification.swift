final class NumericOperationOutputClassification<
    Operation: NumericOperation
>: PrintOutputClassificationStrategy {
    weak var context: ProgramContext?
    private let argumentComponents: [String]
    private let operation = Operation()
    
    init(argument: String) {
        let substringComponents = argument.split(separator: " ")
        self.argumentComponents = substringComponents.map(String.init)
    }
    
    func canOutput() -> Bool {
        return argumentComponents.contains(operation.symbol)
    }
    
    func output() {
        let result = operation(from: parsersWithContext())
        let output = Output(String(result))
        context?.output(output)
    }
    
    private func parsersWithContext() -> [NumericOperationArgumentParser] {
        let parsers = argumentComponents.compactMap(makeParser)
        parsers.forEach { $0.context = context }
        return parsers
    }
    
    private func makeParser(raw: String) -> NumericOperationArgumentParser? {
        return NumericOperationArgumentParser(
            raw: raw,
            symbol: operation.symbol
        )
    }
    
    private func operation(from parsers: [NumericOperationArgumentParser]) -> Int {
        let arguments = parsers.map { $0.parse() }
        guard let head = arguments.first else { return 0 }
        return arguments.dropFirst().reduce(head, operation.function)
    }
}
