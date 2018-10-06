struct InterpreterOutput: ExpressibleByStringLiteral, Equatable {
    let raw: String
    
    init(stringLiteral value: String) {
        self.raw = value
    }
}
