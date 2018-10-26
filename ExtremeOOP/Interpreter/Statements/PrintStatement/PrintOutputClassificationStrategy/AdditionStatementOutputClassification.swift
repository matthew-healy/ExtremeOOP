final class AdditionStatementOutputClassification: PrintOutputClassificationStrategy {
    weak var context: ProgramContext?
    private let argument: String

    init(argument: String) {
        self.argument = argument
    }

    func canOutput() -> Bool {
        return argument == "1 + 1"
    }

    func output() {
        let output = Output("2")
        context?.output(output)
    }
}
