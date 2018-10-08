@testable import ExtremeOOP

final class MockOutputDelegate: InterpreterOutputDelegate {
    var spyOutput: String?
    func output(_ result: Output) {
        let rawResult = result.raw
        if spyOutput == nil {
            spyOutput = rawResult
        } else {
            spyOutput?.append("\n")
            spyOutput?.append(contentsOf: rawResult)
        }
    }
}
