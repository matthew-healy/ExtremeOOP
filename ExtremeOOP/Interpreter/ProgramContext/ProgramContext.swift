class ProgramContext {
    weak var outputDelegate: InterpreterOutputDelegate?
    private let storage = RuntimeStorage()

    // MARK: OutputDelegate facade

    func output(_ output: Output) {
        outputDelegate?.output(output)
    }

    // MARK: RuntimeStorage facade

    func store() {
        storage.assign()
    }

    func load() -> String {
        let value = storage.retrieve()
        return String(value)
    }
}
