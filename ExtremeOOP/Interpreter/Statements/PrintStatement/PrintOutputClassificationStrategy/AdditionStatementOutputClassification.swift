final class AdditionStatementOutputClassification: PrintOutputClassificationStrategy {
    weak var context: ProgramContext?
    private let argument: String

    init(argument: String) {
        self.argument = argument
    }

    func canOutput() -> Bool {
        let index = argument.index(argument.startIndex, offsetBy: 2)
        return argument[index] == "+"
    }

    func output() {
        let firstArgument = argument(at: 0)
        let secondArgument = argument(at: 4)
        let result = add(firstArgument, to: secondArgument)
        let output = Output(String(result))
        context?.output(output)
    }

    private func argument(at index: Int) -> String {
        let argumentIndex = argument.index(argument.startIndex, offsetBy: 0)
        return String(argument[argumentIndex])
    }

    private func add(_ argument: String, to other: String) -> Int {
        guard
            let firstValue = Int(argument),
            let secondValue = Int(other)
        else { return 0 }

        return firstValue + secondValue
    }
}
