struct Program: ExpressibleByStringLiteral {
    private let raw: String

    init(stringLiteral value: String) {
        self.raw = value
    }

    func firstStatement() -> Statement? {
        return firstLine().map(Statement.init)
    }

    private func firstLine() -> String? {
        if raw.isEmpty {
            return nil
        }
        return raw
    }
}
