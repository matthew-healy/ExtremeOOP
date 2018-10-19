class RuntimeStorage {
    private var assignedVariableValue = 0

    func assign() {
        assignedVariableValue = 4
    }

    func retrieve() -> Int {
        return assignedVariableValue
    }
}
