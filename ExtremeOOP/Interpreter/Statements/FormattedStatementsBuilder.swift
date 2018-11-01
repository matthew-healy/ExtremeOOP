struct FormattedStatementsBuilder {
    private let soFar: [String]
    
    init(raw: String) {
        self.soFar = [raw]
    }
    
    private init(soFar: [String]) {
        self.soFar = soFar
    }
    
    func splitting(on delimiter: Character) -> FormattedStatementsBuilder {
        let next = soFar.flatMap { segment in
            return segment.split(separator: delimiter)
            }.map(String.init)
        return FormattedStatementsBuilder(soFar: next)
    }
    
    func trimmingWhitepace() -> FormattedStatementsBuilder {
        let next = soFar.map { segment in
            return segment.trimmingCharacters(in: .whitespaces)
        }
        return FormattedStatementsBuilder(soFar: next)
    }
    
    func build() -> [Statement] {
        let factory = StatementFactory()
        return soFar.map(factory.classifiedStatement)
    }
    
}
