//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Khalid Kamil on 19/04/2024.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {
        
    }
}

class FeedPresenterTests: XCTestCase {

    func test_init_doesNotSendMessageToView() {
        let (_, view) = makeSUT()

        _ = FeedPresenter(view: view)

        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }

    // MARK: - Helpers

    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedPresenter(view: view)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, view)
    }

    private class ViewSpy {
        let messages = [Any]()
    }
}
