final class AdditionArgumentParser {
    weak var context: ProgramContext?
    private let raw: String

    init?(raw: String) {
        guard raw != "+" else { return nil }
        self.raw = raw
    }

    func parse() -> Int {
        if let argument = Int(raw) {
            return argument
        }

        return variableValue()
    }

    private func variableValue() -> Int {
        guard
            let variable = Variable.contained(in: raw),
            let stringValue = context?.load(variable: variable),
            let value = Int(stringValue)
            else { return 0 }
        return value
    }
}
