struct VariableAssignmentStatement: Statement {
    weak var context: ProgramContext?
    private let raw: String

    init(raw: String) {
        self.raw = raw
    }

    func execute() {
        guard let rawVariable = raw.first else { return }
        let variable = Variable(raw: rawVariable)
        let valueString = String(raw.dropFirst(2))
        context?.assign(value: valueString, to: variable)
    }
}
