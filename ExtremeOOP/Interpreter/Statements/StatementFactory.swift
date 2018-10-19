struct StatementFactory {
    private static let printFunction = "PRINT"

    static func classifiedStatement(from raw: String) -> Statement {
        if raw.hasPrefix(printFunction) {
            return PrintStatement(raw: raw)
        }
        if raw.hasPrefix("A=") {
            return VariableAssignmentStatement(raw: raw)
        }
        return NullStatement()
    }
}
