struct PrintStatementClassification: StatementClassificationStrategy {
    private let printFunction = "PRINT"
    private let raw: String
    
    init(raw: String) {
        self.raw = raw
    }
    
    func buildStatement() -> Statement? {
        guard isPrintStatement() else { return nil }
        return PrintStatement(raw: raw)
    }

    private func isPrintStatement() -> Bool {
        return raw.hasPrefix(printFunction)
    }
}
