final class NumericArgumentClassification: PrintOutputClassificationStrategy {
    weak var context: ProgramContext?
    private let argument: String
    
    init(argument: String) {
        self.argument = argument
    }
    
    func canOutput() -> Bool {
        return Int(argument) != nil
    }
    
    func output() {
        let output = Output(argument)
        context?.output(output)
    }
}
