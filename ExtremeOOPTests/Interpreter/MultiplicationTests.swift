import XCTest
@testable import ExtremeOOP

class MultiplicationTests: XCTestCase, InterpreterTesting {

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

    // Can multiply two numbers

    func test_print1Times1_outputs1() {
        assert("PRINT 1 * 1", produces: "1")
    }

    func test_print2Times3_outputs6() {
        assert("PRINT 2 * 3", produces: "6")
    }
}
