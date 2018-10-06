struct Program: ExpressibleByStringLiteral {
    let raw: String
    
    init(stringLiteral value: String) {
        self.raw = value
    }
}
