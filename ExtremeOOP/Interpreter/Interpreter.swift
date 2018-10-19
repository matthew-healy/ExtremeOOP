final class Interpreter {
    private let context = ProgramContext()

    var outputDelegate: InterpreterOutputDelegate? {
        get { return context.outputDelegate }
        set { context.outputDelegate = newValue }
    }
    
    init() { }
    
    func interpret(rawProgram: String) {
        let program = Program(raw: rawProgram, context: context)
        guard !program.isEmpty else {
            outputDelegate?.output("")
            return
        }
        program.executeAllStatements()
    }
}
