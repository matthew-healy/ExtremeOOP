import XCTest
@testable import ExtremeOOP

class VariableTests: XCTestCase, InterpreterTesting {

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

    func test_printUnassignedVariable_outputs0() {
        assert("PRINT A", produces: "0")
    }

    func test_printA_Ais4_outputs4() {
        assert("A=4; PRINT A", produces: "4")
    }

    func test_printA_Ais9_outputs9() {
        assert("A=9; PRINT A", produces: "9")
    }

    func test_printB_BisMinus3_outputsMinus3() {
        assert("B=-3; PRINT B", produces: "-3")
    }

    func test_printB_Ais112_outputs0() {
        assert("A=112; PRINT B", produces: "0")
    }

}
