//
//  TesteUnitario1Tests.swift
//  TesteUnitario1Tests
//
//  Created by Vagner Reis on 11/03/26.
//

import XCTest
@testable import TesteUnitario1

final class TesteUnitario1Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let viewModel = TaskViewModel()
        viewModel.addTask("Levar o cachorro para passear")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
