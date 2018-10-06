final class Interpreter {
    weak var outputDelegate: InterpreterOutputDelegate?
    
    init() {
        
    }
    
    func interpret(program: Program) {
        guard let statement = program.firstStatement() else {
            outputDelegate?.output("")
            return
        }
        let firstStatementResult = statement.execute()
        outputDelegate?.output(firstStatementResult)
    }
}
