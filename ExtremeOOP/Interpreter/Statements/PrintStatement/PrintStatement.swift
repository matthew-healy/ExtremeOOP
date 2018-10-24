struct PrintStatement: Statement {
    weak var context: ProgramContext?
    private let strategies: PrintOutputClassificationStrategies

    init(raw: String) {
        let argument = String(raw.dropFirst(6))
        self.strategies = PrintOutputClassificationStrategies(argument: argument)
    }

    func execute() {
        strategies.executeStrategies(in: context)
    }
}
