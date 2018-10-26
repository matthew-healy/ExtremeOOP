import XCTest
@testable import ExtremeOOP

class PrintTests: XCTestCase, InterpreterTesting {

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

    func test_barePrintStatement_outputsNewline() {
        assert("PRINT", produces: "\n")
    }

    func test_printHelloWorld_outputsHelloWorld() {
        assert("PRINT \"Hello, World!\"", produces: "Hello, World!")
    }

    func test_printCodeIsFun_outputsCodeIsFun() {
        assert("PRINT \"Code is fun\"", produces: "Code is fun")
    }

    func test_print123_outputs123() {
        assert("PRINT 123", produces: "123")
    }

    func test_printMinus3_outputsMinus3() {
        assert("PRINT -3", produces: "-3")
    }

    func test_print9_outputs9() {
        assert("PRINT 9", produces: "9")
    }

}
