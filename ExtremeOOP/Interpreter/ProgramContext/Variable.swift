struct Variable: Hashable {
    static func contained(in string: String) -> Variable? {
        guard let first = string.first else { return nil }
        let rawVariable = String(first)
        return Variable(raw: rawVariable)
    }

    private let raw: String

    init(raw: String) {
        self.raw = raw
    }
}
