import XCTest

import NCCSerializedTests

var tests = [XCTestCaseEntry]()
tests += NCCSerializedTests.allTests()
XCTMain(tests)
