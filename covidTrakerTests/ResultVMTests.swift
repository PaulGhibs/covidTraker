//
//  ResultVMTests.swift
//  covidTrakerTests
//
//  Created by Paul Ghibeaux on 10/12/2021.
//

import Foundation
import XCTest

@testable import covidTraker

class ResultVMTests: XCTestCase {

    var detailVM: ResultViewModel!
    var mockAPIService: MockServiceDataflow!
   
   // ----------------------------------
    //  MARK: - Detail VMTests-
    //
    override func setUp() {
        super.setUp()
        mockAPIService = MockServiceDataflow()

        detailVM = ResultViewModel(apiService: mockAPIService)
    }
    
    override func tearDown() {
        detailVM = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_fetch_vm() {
        
        // When
        detailVM.loadData {_ in
            XCTAssertNotNil(self.detailVM.sections)
        }
        
        // then
        XCTAssertNotNil(mockAPIService?.loadDataIsCalled)
    }
    
    func test_fetch_vm_failed() {
        
        // Given
        let error = try? CovidError.wrongCollections.errorMessages()
        
        // When
        
        mockAPIService?.fetchFail(error: (CovidError.wrongCollections))
        
        // Then
        XCTAssertFalse(false, error.debugDescription)

    }
    
    
   
    
}
