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

}
