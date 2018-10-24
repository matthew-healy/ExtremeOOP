struct VariableStatementClassification: StatementClassificationStrategy {
    private let assignment: Character = "="
    private let raw: String
    
    init(raw: String) {
        self.raw = raw
    }
    
    func buildStatement() -> Statement? {
        guard isVariableAssignment() else { return nil }
        return VariableAssignmentStatement(raw: raw)
    }

    private func isVariableAssignment() -> Bool {
        let index = raw.index(raw.startIndex, offsetBy: 1)
        return raw[index] == assignment
    }
}
