import XCTest
@testable import Runner

class RunnerTests: XCTestCase {

    func testStartReceivingDataSuccess() {
        let expectation = self.expectation(description: "Data received successfully")

        DataCommunicationManager.shared.startReceivingData { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                print("Received data: \(data)")
                expectation.fulfill()
            case .failure:
                // This test case is focused on success, so failure means test fail
                XCTFail("Expected success but got failure")
            }
        }

        wait(for: [expectation], timeout: 3.0)
    }

    func testStartReceivingDataFailure() {
        let expectation = self.expectation(description: "Data reception failed")
        var gotFailure = false

        // We'll manually force a failure by temporarily changing Bool.random to always false
        // You could also test by running multiple times and catching random failures.
        for _ in 1...10 {
            DataCommunicationManager.shared.startReceivingData { result in
                if case .failure = result {
                    gotFailure = true
                    expectation.fulfill()
                }
            }
        }

        wait(for: [expectation], timeout: 5.0)
        XCTAssertTrue(gotFailure, "Expected at least one failure in simulated runs")
    }

    func testStopReceivingData() {
        DataCommunicationManager.shared.startReceivingData { _ in }
        DataCommunicationManager.shared.stopReceivingData()

        // After stopping, timer should be nil
        XCTAssertNil(DataCommunicationManager.shared.timer)
        XCTAssertFalse(DataCommunicationManager.shared.isReceiving)
    }
}
