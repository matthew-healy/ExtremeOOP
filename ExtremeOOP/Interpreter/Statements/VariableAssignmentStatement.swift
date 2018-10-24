struct VariableAssignmentStatement: Statement {
    weak var context: ProgramContext?
    private let raw: String

    init(raw: String) {
        self.raw = raw
    }

    func execute() {
        let valueString = String(raw.dropFirst(2))
        let value = Int(valueString)!
        context?.store(value: value)
    }
}
