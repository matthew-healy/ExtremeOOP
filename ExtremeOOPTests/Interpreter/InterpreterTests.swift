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

    func test_emptyProgramProducesEmptyOutput() {
        subject.interpret(program: "")
        XCTAssertEqual("", mockOutputDelegate.spyOutput)
    }

}
