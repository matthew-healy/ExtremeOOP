final class Interpreter {
    weak var outputDelegate: InterpreterOutputDelegate?
    
    init() {
        
    }
    
    func interpret(program: Program) {
        let output: InterpreterOutput
        output = program.isEmpty ? "" : "\n"
        outputDelegate?.output(output)
    }
}
