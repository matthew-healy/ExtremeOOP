struct Output: ExpressibleByStringLiteral, Equatable {
    let raw: String
    
    init(_ raw: String) {
        self.raw = raw
    }

    init(stringLiteral value: String) {
        self.raw = value
    }
}
