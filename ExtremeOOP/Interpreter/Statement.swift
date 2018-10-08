struct Statement {
    private let raw: String

    init(raw: String) {
        self.raw = raw
    }

    func execute() -> Output {
        let argument = raw.dropFirst(6)
        if argument.isEmpty {
            return "\n"
        }
        return Output(argument.filter { $0 != "\"" })
    }
}
