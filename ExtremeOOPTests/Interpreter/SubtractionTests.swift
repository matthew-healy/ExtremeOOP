import XCTest
@testable import ExtremeOOP

class SubtractionTests: XCTestCase, InterpreterTesting {

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

    // Can subtract two numbers

    func test_print1Minus1_outputs0() {
        assert("PRINT 1 - 1", produces: "0")
    }

    func test_print1Minus2_outputsMinus1() {
        assert("PRINT 1 - 2", produces: "-1")
    }

    // Can subtract more than two numbers

    func test_print4Minus1Minus1_outputs2() {
        assert("PRINT 4 - 1 - 1", produces: "2")
    }

    func test_print6Minus1Minus2_outputs3() {
        assert("PRINT 6 - 1 - 2", produces: "3")
    }

    // Can subtract variables

    func test_print2MinusA_AIs1_outputs1() {
        assert("A=1; PRINT 2 - A", produces: "1")
    }

    func test_printBMinus3_BIs21_outputs18() {
        assert("B=21; PRINT B - 3", produces: "18")
    }

}
