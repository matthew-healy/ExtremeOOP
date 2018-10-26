import XCTest
@testable import ExtremeOOP

class InterpreterTests: XCTestCase, InterpreterTesting {
    
    var subject: Interpreter!
    var mockOutputDelegate: MockOutputDelegate!
    
    override func setUp() {
        super.setUp()
        prepare()
    }
    
    override func tearDown() {
        destroy()
        super.tearDown()
    }

    func test_emptyProgram_producesEmptyOutput() {
        assert("", produces: "")
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
