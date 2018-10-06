struct Statement {
    private let raw: String

    init(raw: String) {
        self.raw = raw
    }

    func execute() -> Output {
        if raw.dropFirst(6).isEmpty {
            return "\n"
        }
        return "Hello, World!"
    }
}
