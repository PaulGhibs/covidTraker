//
//  CountryVMTests.swift
//  covidTrakerTests
//
//  Created by Paul Ghibeaux on 10/12/2021.
//

import Foundation
import XCTest

@testable import covidTraker

class CountryVMTests: XCTestCase {

    var countryVM: CountryViewModel!
        // ----------------------------------
        //  MARK: - Search VM -
        //
    override func setUp() {
        super.setUp()
        countryVM = CountryViewModel()
    }
    
    override func tearDown() {
        countryVM = nil
        super.tearDown()
    }
    
    func test_fetch_vm() {
       
        countryVM.loadData {_ in
            XCTAssertNotNil(self.countryVM.sections)
        }
        
     
    }
    
    func test_fetch_vm_failed() {
        
        // Given a failed fetch with a certain failure
        let error = try? CovidError.noInfoFound.errorMessages()
        
        // When
        
        
        // then
        XCTAssertFalse(false, error.debugDescription)

    }
    
    
   
    
}
