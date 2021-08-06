//
//  CocoaPodsXCConfigIssueFrameworkTests.swift
//  CocoaPodsXCConfigIssueFrameworkTests
//
//  Created by Maarten van der Velden on 06/08/2021.
//

import XCTest
@testable import CocoaPodsXCConfigIssueFramework

class FileTests: XCTestCase {
    func testFileCreation() {
        let file = File()
        XCTAssertNil(file.alamofireSession)
    }
}
