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
        guard let nextStatement = program.secondStatement() else {
            return
        }
        let secondStatementResult = nextStatement.execute()
        outputDelegate?.output(secondStatementResult)
    }
}
