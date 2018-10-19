struct Statement {
    private let argument: String

    private var isArgumentNumeric: Bool {
        return Int(argument) != nil
    }

    private var isArgumentAVariable: Bool {
        return argument.count == 1
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
        if isArgumentAVariable {
            return "0"
        }
        return Output(argument.filter { $0 != "\"" })
    }


}
