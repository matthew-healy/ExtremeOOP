final class Interpreter {
    weak var outputDelegate: InterpreterOutputDelegate?
    
    init() {
        
    }
    
    func interpret(program: Program) {
        outputDelegate?.output("")
    }
}
