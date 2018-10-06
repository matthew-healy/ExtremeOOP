struct Program: ExpressibleByStringLiteral {
    let raw: String
    
    var isEmpty: Bool {
        return raw.isEmpty
    }

    init(stringLiteral value: String) {
        self.raw = value
    }
}
