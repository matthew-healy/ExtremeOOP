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
        guard let context = context else { return }
        
        if argument.isEmpty {
            context.output("\n"); return
        }
        if isArgumentNumeric {
            context.output(Output(argument)); return
        }
        if isArgumentAVariable {
            outputVariable(from: context); return
        }
        let stringArgument = Output(argument.filter { $0 != "\"" })
        context.output(stringArgument)
    }

    private func outputVariable(from context: ProgramContext) {
        let output = Output(context.load())
        context.output(output)
    }
}
