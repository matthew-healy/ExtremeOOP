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

    func test_emptyProgram_producesEmptyOutput() {
        assert("", produces: "")
    }

    func test_barePrintStatement_outputsNewline() {
        assert("PRINT", produces: "\n")
    }

    func test_printHelloWorld_outputsHelloWorld() {
        assert("PRINT \"Hello, World!\"", produces: "Hello, World!")
    }

    func test_printCodeIsFun_outputsCodeIsFun() {
        assert("PRINT \"Code is fun\"", produces: "Code is fun")
    }

    func test_twoPrintStatements_outputsBothArgumentsSeparatedByNewLine() {
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

    func test_threePrintStatements_outputsAllArgumentsSeparatedByNewLine() {
        assert("""
                PRINT "Yo"
                PRINT "What's"
                PRINT "Up"
                """,
               produces: """
                Yo
                What's
                Up
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
