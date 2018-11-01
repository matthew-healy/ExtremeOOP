struct VariableAssignmentStatement: Statement {
    weak var context: ProgramContext?
    private let raw: String

    init(raw: String) {
        self.raw = raw
    }

    func execute() {
        guard
            let variable = Variable.contained(in: raw)
        else { return }
        let valueString = String(raw.dropFirst(2))
        context?.assign(value: valueString, to: variable)
    }
}
