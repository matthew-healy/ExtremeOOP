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
        assert("", produces: "")
    }

    func test_barePrintStatementOutputsNewline() {
        assert("PRINT", produces: "\n")
    }

    func test_printHelloWorldOutputsHelloWorld() {
        assert("PRINT \"Hello, World!\"", produces: "Hello, World!")
    }

    func test_printCodeIsFunOutputsCodeIsFun() {
        assert("PRINT \"Code is fun\"", produces: "Code is fun")
    }

    func test_twoPrintStatementsInARowOutputsBothArgumentsSeparatedByNewLine() {
        assert("""
                PRINT "Hi"
                PRINT "Hello"
                """,
               produces: """
                Hi
                Hello
                """
        )
    }

}

private extension InterpreterTests {
    func assert(
        _ program: Program, produces expectedOutputString: String,
        file: StaticString = #file, line: UInt = #line
    ) {
        subject.interpret(program: program)
        XCTAssertEqual(expectedOutputString, mockOutputDelegate.spyOutput, file: file, line: line)
    }
}
