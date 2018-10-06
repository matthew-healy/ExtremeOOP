@testable import ExtremeOOP

final class MockOutputDelegate: InterpreterOutputDelegate {
    var spyOutput: String?
    func output(_ result: InterpreterOutput) {
        spyOutput = result.raw
    }
}
