final class Interpreter {
    weak var outputDelegate: InterpreterOutputDelegate?
    
    init() { }
    
    func interpret(program: Program) {
        guard !program.isEmpty else {
            outputDelegate?.output("")
            return
        }
        program.executeAllStatements(outputTo: outputDelegate)
    }
}
