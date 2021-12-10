//
//  WorldVMTests.swift
//  covidTrakerTests
//
//  Created by Paul Ghibeaux on 10/12/2021.
//



import Foundation
import XCTest

@testable import covidTraker

class WorldVMTests: XCTestCase {

    var worldVM: WorldViewModel!
    var mockAPIService: MockServiceDataflow!
    

    // ----------------------------------
    //  MARK: - Recipe VMTests -
    //
    override func setUp() {
        super.setUp()
        mockAPIService = MockServiceDataflow()
        worldVM = WorldViewModel(apiService: mockAPIService)
    }
    
    override func tearDown() {
        worldVM = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_fetch_collection() {
        // Given
        mockAPIService.fakeCovidTab = [CovidCollection]()
        let choosenCountry = "world"

        // When
        worldVM.loadData {_ in
            XCTAssertNotNil(self.worldVM.sections)
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
        
        worldVM.updateLoadingStatus = { [weak worldVM] in
            loadingStatus = worldVM!.isLoading
            expect.fulfill()
        }
        
        //when fetching
        worldVM.loadData { result in
            
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
        self.worldVM.loadData {  _ in

            XCTAssertNotNil(self.worldVM.sections)
        }

        mockAPIService.fetchFail(error: (CovidError.badURL))

        // then
        XCTAssertFalse(false, error.localizedDescription)


    }



    func test_cell_view_model() {
        // Given
        let fakeerror = CovidError.badURL
        // When
        worldVM.loadData { error in
            self.mockAPIService.fetchFail(error: fakeerror)
        }

        
        // then
        XCTAssertEqual( worldVM.numberOfItems(in: 10), mockAPIService.fakeCovidTab.count )
        XCTAssertEqual( worldVM.numberOfSections(), mockAPIService.fakeCovidTab.count )

    }
    


    func test_reload_data() {
        // given
        let covid: CovidCollection = MockServiceDataflow.covidTab.first ?? CovidCollection.init(activeCasesText: "", countryText: "", lastUpdate: "", newCasesText : "", newDeathsText: "", totalCasesText: "", totalDeathsText: "", totalRecoveredText: "")
        let covidSection = WorldSection.init(collection: covid)
        let mockinfos: () = mockAPIService.mockinfos = .failure(CovidError.badURL)
        // when
        self.worldVM.loadData { error in
            _ = covidSection.cellsVM
            _ = mockinfos
            // then
            XCTAssertEqual(self.worldVM.sections.count, 0)
            XCTAssertEqual(self.worldVM.sections.count, 0)
        }



    }
    
//    func test_reload_with_Invalid_Data() {
//        // given
//        let rData = Data()
//        let covid: CovidCollection = DataFlowService.parse(rData)
//
//        // when
//        self.worldVM.loadData { error in
//            // then
//            self.mockAPIService.mockinfos = .success([covid])
//            XCTAssertFalse((self.worldVM.sections.count != 0),"\( String(describing: error?.localizedDescription))")
//            XCTAssertNotEqual(self.worldVM.sections.count, 2)
//        }
//
//
//
//    }

    
}
