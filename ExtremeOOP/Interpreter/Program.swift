struct Program {
    private let context: ProgramContext
    private let statements: [Statement]


    var isEmpty: Bool {
        return statements.isEmpty
    }

    init(raw: String, context: ProgramContext) {
        let rawStatements = raw.split(separator: "\n").map(String.init)
        let factory = StatementFactory()
        self.statements = rawStatements.map(factory.classifiedStatement)
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
