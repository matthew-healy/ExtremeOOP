final class StringArgumentClassification: PrintOutputClassificationStrategy {
    weak var context: ProgramContext?
    private let argument: String
    
    init(argument: String) {
        self.argument = argument
    }
    
    func canOutput() -> Bool {
        return true
    }
    
    func output() {
        let stringArgument = Output(argument.filter { $0 != "\"" })
        context?.output(stringArgument)
    }
}
