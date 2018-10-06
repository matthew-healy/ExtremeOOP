@testable import ExtremeOOP

final class MockOutputDelegate: InterpreterOutputDelegate {
    var spyOutput: String?
    func output(_ result: Output) {
        spyOutput = result.raw
    }
}
