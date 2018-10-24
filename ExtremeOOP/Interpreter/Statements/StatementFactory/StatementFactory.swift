struct StatementFactory {
    private let strategies: [StatementClassificationStrategy.Type] = [
        VariableStatementClassification.self,
        PrintStatementClassification.self
    ]

    func classifiedStatement(from raw: String) -> Statement {
        return strategies.lazy.map { $0.init(raw: raw) }
            .map { $0.buildStatement() }
            .compactMap { $0 }
            .first
            ?? NullStatement()
    }
}
