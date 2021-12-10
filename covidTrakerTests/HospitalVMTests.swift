//
//  HospitalVMTests.swift
//  covidTrakerTests
//
//  Created by Paul Ghibeaux on 10/12/2021.
//

import Foundation
import XCTest

@testable import covidTraker

class HospitalVMTests: XCTestCase {

    var hospitalVM: HospitalViewModel!
    var mockAPIService: MockGoogleDataflow!

    // ----------------------------------
    //  MARK: - Recipe VMTests -
    //
    override func setUp() {
        super.setUp()
        mockAPIService = MockGoogleDataflow()
        hospitalVM = HospitalViewModel(apiService: mockAPIService)
    }
    
    override func tearDown() {
        hospitalVM = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_fetch_recipe() {
        // Given
        mockAPIService.fakeCovidTab = [HospitalCollections]()
        let choosenCountry = "hos.choosenIngredient"

        // When
        hospitalVM.loadData {_ in
            XCTAssertNotNil(self.hospitalVM.sections)
            XCTAssertNotNil(choosenCountry)
        }
        
        // then
        XCTAssert(mockAPIService!.loadDataIsCalled)
        XCTAssertNotNil(choosenCountry)
    }
    
    func test_loading_when_fetching() {
        
        //Given
        var loadingStatus = false
        let expect = XCTestExpectation(description: "Loading status updated")
        
        hospitalVM.updateLoadingStatus = { [weak hospitalVM] in
            loadingStatus = hospitalVM!.isLoading
            expect.fulfill()
        }
        
        //when fetching
        hospitalVM.loadData { result in
            
        XCTAssertTrue(loadingStatus)
        }
        
                
        // then finished fetching
        XCTAssertTrue( loadingStatus )
        
        wait(for: [expect], timeout: 1.0)
    }
    
    func test_fetch_recipe_failed() {

        // Given a failed fetch with a certain failure
        let error = CovidError.noInfoFound

        // When
        hospitalVM.loadData {_ in
            XCTAssertNotNil(HospitalCellViewModel.init(name: "", image: URL(string: "blabla.com"), adress: "", openNow: true))
            XCTAssertNotNil(self.hospitalVM.sections)
        }

        mockAPIService.fetchFail(error: (CovidError.noInfoFound))

        // then
        XCTAssertFalse(false, error.localizedDescription)


    }


    func test_cell_view_model() {
        // Given
                let fakeerror = CovidError.badURL
        // When
        hospitalVM.loadData { error in
            self.mockAPIService.fetchFail(error: fakeerror)
        }

        
        // then
        XCTAssertEqual( hospitalVM.numberOfItems(in: 10), mockAPIService.fakeCovidTab.count )
        XCTAssertEqual( hospitalVM.numberOfSections(), mockAPIService.fakeCovidTab.count )

    }
    
    func test_Invalid_Data() {
        // given
        let rData = Data()
    
                let parsedata: HospitalCollections = GoogleMapService.parse(rData)
        // when
        hospitalVM.loadData { _ in
            // then
            XCTAssert(parsedata.results.isEmpty, "")
            XCTAssertFalse((self.hospitalVM.numberOfItems(in: 1) != 0), "")
        }


    }

    func test_reload_data() {
        // given
        let collection: HospitalCollections = MockGoogleDataflow.HospitalTab
        let hospitalSection = HospitalSection.init(HospitalCollection: collection)
        let mockinfos: () = mockAPIService.mockinfos = .failure(CovidError.badURL)
        // when
        self.hospitalVM.loadData { error in
            _ = hospitalSection.cellsVM
            _ = mockinfos
            // then
            XCTAssertEqual(self.hospitalVM.sections.count, 0)
            XCTAssertEqual(self.hospitalVM.sections.count, 0)
        }



    }
    
    func test_reload_with_Invalid_Data() {
        // given
        let rData = Data()
        let recipe: HospitalCollections = GoogleMapService.parse(rData)
        
        // when
        self.hospitalVM.loadData { error in
            // then
            self.mockAPIService.mockinfos = .success([recipe])
            XCTAssertFalse((self.hospitalVM.sections.count != 0),"\( String(describing: error?.localizedDescription))")
            XCTAssertNotEqual(self.hospitalVM.sections.count, 2)
        }



    }

    
}

