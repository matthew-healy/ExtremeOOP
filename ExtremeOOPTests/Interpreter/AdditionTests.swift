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

    // Can add two numbers

    func test_printOnePlusOne_outputs2() {
        assert("PRINT 1 + 1", produces: "2")
    }

    func test_printTwoPlusTwo_outputs4() {
        assert("PRINT 2 + 2", produces: "4")
    }

    func test_print10Plus18_outputs28() {
        assert("PRINT 10 + 18", produces: "28")
    }

    // Can add more than two numbers

    func test_print4Plus4Plus12_outputs20() {
        assert("PRINT 4 + 4 +  12", produces: "20")
    }

    // Can add variables

    func test_printAPlus1_AIs1_outputs2() {
        assert("""
                A=1
                PRINT A + 1
                """, produces: "2"
        )
    }

    func test_print2PlusA_AIs2_outputs4() {
        assert("""
                A=2
                PRINT 2 + A
                """, produces: "4"
        )
    }
}
