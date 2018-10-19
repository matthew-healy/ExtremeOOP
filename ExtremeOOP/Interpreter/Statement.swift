struct Statement {
    private let argument: String

    private var isArgumentNumeric: Bool {
        return Int(argument) != nil
    }

    init(raw: String) {
        self.argument = String(raw.dropFirst(6))
    }

    func execute() -> Output {
        if argument.isEmpty {
            return "\n"
        }
        if isArgumentNumeric {
            return Output(argument)
        }
        return Output(argument.filter { $0 != "\"" })
    }


}
