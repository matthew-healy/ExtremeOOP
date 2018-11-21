struct PrintOutputClassificationStrategies {
    private let argument: String
    private let strategies: [PrintOutputClassificationStrategy.Type] = [
        EmptyOutputClassification.self,
        NumericArgumentClassification.self,
        VariableArgumentClassification.self,
        NumericOperationOutputClassification<Addition>.self,
        NumericOperationOutputClassification<Subtraction>.self,
        StringArgumentClassification.self
    ]
    
    init(argument: String) {
        self.argument = argument
    }
    
    func executeStrategies(in context: ProgramContext?) {
        let builtStrategies = strategies.map { $0.init(argument: argument) }
        builtStrategies.forEach { $0.context = context }
        let selectedStrategy = builtStrategies.first(where: { $0.canOutput() } )
        selectedStrategy?.output()
    }
}
