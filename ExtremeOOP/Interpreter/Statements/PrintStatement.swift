struct PrintStatement: Statement {
    weak var context: ProgramContext?
    private let argument: String
    
    private var isArgumentNumeric: Bool {
        return Int(argument) != nil
    }

    private var isArgumentAVariable: Bool {
        return argument.count == 1
    }

    init(raw: String) {
        self.argument = String(raw.dropFirst(6))
    }

    func execute() {
        let outputDelegate = context?.outputDelegate
        
        if argument.isEmpty {
            outputDelegate?.output("\n"); return
        }
        if isArgumentNumeric {
            outputDelegate?.output(Output(argument)); return
        }
        if isArgumentAVariable {
            let storage = context?.storage
            let outputString = String(storage?.retrieve() ?? 0)
            let output = Output(outputString)
            outputDelegate?.output(output); return
        }
        let stringArgument = Output(argument.filter { $0 != "\"" })
        outputDelegate?.output(stringArgument)
    }
}
