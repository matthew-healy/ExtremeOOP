import XCTest
@testable import ExtremeOOP

class InterpreterTests: XCTestCase {
    
    private var subject: Interpreter!
    private var mockOutputDelegate: MockOutputDelegate!
    
    override func setUp() {
        super.setUp()
        subject = Interpreter()
        mockOutputDelegate = MockOutputDelegate()
        subject.outputDelegate = mockOutputDelegate
    }
    
    override func tearDown() {
        mockOutputDelegate = nil
        subject = nil
        super.tearDown()
    }

    func test_emptyProgramProducesEmptyOutput() {
        subject.interpret(program: "")
        XCTAssertEqual("", mockOutputDelegate.spyOutput)
    }

    func test_barePrintStatementOutputsNewline() {
        subject.interpret(program: "PRINT")
        XCTAssertEqual("\n", mockOutputDelegate.spyOutput)
    }

    func test_printHelloWorldOutputsHelloWorld() {
        subject.interpret(program: "PRINT \"Hello, World!\"")
        XCTAssertEqual("Hello, World!", mockOutputDelegate.spyOutput)
    }

    func test_printCodeIsFunOutputsCodeIsFun() {
        subject.interpret(program: "PRINT \"Code is fun\"")
        XCTAssertEqual("Code is fun", mockOutputDelegate.spyOutput)
    }

}
