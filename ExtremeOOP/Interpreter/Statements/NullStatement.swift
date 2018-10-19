struct NullStatement: Statement {
    weak var context: ProgramContext?
    func execute() { /* NoOp */ }
}
