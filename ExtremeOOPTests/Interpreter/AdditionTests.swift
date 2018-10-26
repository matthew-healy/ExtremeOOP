import XCTest
@testable import ExtremeOOP

class AdditionTests: XCTestCase, InterpreterTesting {

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

    func test_printOnePlusOne_outputs2() {
        assert("PRINT 1 + 1", produces: "2")
    }

    func test_printTwoPlusTwo_outputs4() {
        assert("PRINT 2 + 2", produces: "4")
    }

    func test_print10Plus18_outputs28() {
        assert("PRINT 10 + 18", produces: "28")
    }
}
