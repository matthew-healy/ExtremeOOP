class ProgramContext {
    weak var outputDelegate: InterpreterOutputDelegate?
    private let storage = RuntimeStorage()

    // MARK: OutputDelegate facade

    func output(_ output: Output) {
        outputDelegate?.output(output)
    }

    // MARK: RuntimeStorage facade

    func assign(value: String, to variable: Variable) {
        storage.store(value: value, into: variable)
    }

    func load(variable: Variable) -> String {
        let value = storage.retrieve(from: variable)
        return value
    }
}
