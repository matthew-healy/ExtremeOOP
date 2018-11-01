final class VariableArgumentClassification: PrintOutputClassificationStrategy {
    weak var context: ProgramContext?
    private let argument: String
    
    init(argument: String) {
        self.argument = argument
    }
    
    func canOutput() -> Bool {
        return argument.count == 1
    }
    
    func output() {
        guard
            let variable = Variable.contained(in: argument),
            let storedValue = context?.load(variable: variable)
            else { return }
        let output = Output(storedValue)
        context?.output(output)
    }
}
