protocol Statement {
    var context: ProgramContext? { get set }
    func execute()
}
