import XCTest
@testable import ExtremeOOP

protocol InterpreterTesting: class {
    var subject: Interpreter! { get set }
    var mockOutputDelegate: MockOutputDelegate! { get set }
}

extension InterpreterTesting {
    func prepare() {
        subject = Interpreter()
        mockOutputDelegate = MockOutputDelegate()
        subject.outputDelegate = mockOutputDelegate
    }

    func destroy() {
        subject = nil
        mockOutputDelegate = nil
    }

    func assert(
        _ program: String, produces expectedOutputString: String,
        file: StaticString = #file, line: UInt = #line
        ) {
        subject.interpret(rawProgram: program)
        XCTAssertEqual(expectedOutputString, mockOutputDelegate.spyOutput, file: file, line: line)
    }
}
