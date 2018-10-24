class RuntimeStorage {
    private var assignedVariableValue = 0

    func assign(value: Int) {
        assignedVariableValue = value
    }

    func retrieve() -> Int {
        return assignedVariableValue
    }
}
