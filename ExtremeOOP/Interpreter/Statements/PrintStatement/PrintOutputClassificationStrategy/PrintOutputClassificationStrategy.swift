protocol PrintOutputClassificationStrategy: class {
    var context: ProgramContext? { get set }
    init(argument: String)
    func canOutput() -> Bool
    func output()
}
