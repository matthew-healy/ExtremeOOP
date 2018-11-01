struct Program {
    private let context: ProgramContext
    private let statements: [Statement]

    var isEmpty: Bool {
        return statements.isEmpty
    }

    init(raw: String, context: ProgramContext) {
        self.statements = FormattedStatementsBuilder(raw: raw)
            .splitting(on: "\n")
            .splitting(on: ";")
            .trimmingWhitepace().build()
        self.context = context
    }

    func executeAllStatements() {
        statements.forEach { statement in
            var statement = statement
            statement.context = context
            statement.execute()
        }
    }
}
