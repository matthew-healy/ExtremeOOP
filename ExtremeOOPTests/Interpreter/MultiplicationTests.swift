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

    // Can multiply more than two numbers

    func test_print2Times2Times2_outputs8() {
        assert("PRINT 2 * 2 * 2", produces: "8")
    }

    // Can multiple two variables

    func test_printATimesBTimesC_AIs3_BIs10_CIs2_is60() {
        assert("""
                A=3
                B=10
                C=2
                PRINT A * B * C
                """,
               produces: "60"
        )
    }
}
