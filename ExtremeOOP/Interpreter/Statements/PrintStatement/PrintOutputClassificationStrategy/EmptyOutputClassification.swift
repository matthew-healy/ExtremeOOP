final class EmptyOutputClassification: PrintOutputClassificationStrategy {
    weak var context: ProgramContext?
    private let argument: String
    
    init(argument: String) {
        self.argument = argument
    }
    
    func canOutput() -> Bool {
        return argument.isEmpty
    }
    
    func output() {
        context?.output("\n")
    }
}
