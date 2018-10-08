struct Program: ExpressibleByStringLiteral {
    private let raw: String

    init(stringLiteral value: String) {
        self.raw = value
    }

    func firstStatement() -> Statement? {
        return extractStatement(onLine: 0)
    }

    func secondStatement() -> Statement? {
        return extractStatement(onLine: 1)
    }

    private func extractStatement(onLine lineNumber: Int) -> Statement? {
        let rawStatements = raw.split(separator: "\n").map(String.init)
        let statements = rawStatements.map(Statement.init)
        guard statements.count > lineNumber else { return nil }
        return statements[lineNumber]
    }
}
