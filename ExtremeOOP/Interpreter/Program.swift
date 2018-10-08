struct Program: ExpressibleByStringLiteral {
    private let statements: [Statement]

    var isEmpty: Bool {
        return statements.isEmpty
    }

    init(stringLiteral value: String) {
        let raw = value.split(separator: "\n").map(String.init)
        self.statements = raw.map(Statement.init)
    }

    func executeAllStatements(outputTo outputDelegate: InterpreterOutputDelegate?) {
        statements.forEach { statement in
            let result = statement.execute()
            outputDelegate?.output(result)
        }
    }
}
