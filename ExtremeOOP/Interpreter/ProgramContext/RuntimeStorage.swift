class RuntimeStorage {
    private var assignedVariables: [Variable : String] = [:]

    func store(value: String, into variable: Variable) {
        assignedVariables[variable] = value
    }

    func retrieve(from variable: Variable) -> String {
        return assignedVariables[variable, default: "0"]
    }
}
