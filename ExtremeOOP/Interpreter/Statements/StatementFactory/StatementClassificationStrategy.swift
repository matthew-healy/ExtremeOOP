protocol StatementClassificationStrategy {
    init(raw: String)
    func buildStatement() -> Statement?
}
