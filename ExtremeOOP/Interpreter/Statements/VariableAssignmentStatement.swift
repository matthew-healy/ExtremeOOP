struct VariableAssignmentStatement: Statement {
    weak var context: ProgramContext?
    private let raw: String

    init(raw: String) {
        self.raw = raw
    }

    func execute() {
        context?.store()
    }
}
