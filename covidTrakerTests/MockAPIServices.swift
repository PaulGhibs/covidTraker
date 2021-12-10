//
//  MockAPIServices.swift
//  covidTrakerTests
//
//  Created by Paul Ghibeaux on 10/12/2021.
//

import Foundation
@testable import covidTraker
import XCTest

class MockServiceDataflow : APIService {
 
    //MARK: - Properties
    var loadDataIsCalled = true
    var completeClosure: ((Result<[CovidCollection], CovidError>) -> Void)!
    var fakeCovidTab: [CovidCollection] = [CovidCollection]()
    var covidError: ((CovidError?)->())!
    var mockinfos: Result<[CovidCollection], CovidError>?
    
    static let covidTab : [CovidCollection] = []
    var covidCollection : CovidCollection!

    //MARK: - methods from APIServiceProtocols
    func requestInfos(with country: String, callback: @escaping Callback) {
        let _: URL! = try! MockServiceDataflow.createURL(with: country)
        callback(false, country)
    }
    
    static func createURL(with country: String) throws -> URL? {
        let completeURL = "https://covid-19.dataflowkit.com/v1/"
        return URL(string: completeURL)
        
    }
    
    static func parse<CovidCollection: Decodable>(_ data: Data) -> CovidCollection {
        do {
            let covid = try JSONDecoder().decode(CovidCollection.self, from: data)
            return covid
        } catch {

            print("Unknown error")
        }
        return covidTab as! CovidCollection
    }
    
    // Fetch Failed
    func fetchFail(error: CovidError?) {
        guard error != nil else {
            return}
        print("error")

        
    }
        
    
}



class MockGoogleDataflow : APIService {
 
    //MARK: - Properties
    var loadDataIsCalled = true
    var completeClosure: ((Result<[HospitalCollections], CovidError>) -> Void)!
    var fakeCovidTab: [HospitalCollections] = [HospitalCollections]()
    var covidError: ((CovidError?)->())!
    var mockinfos: Result<[HospitalCollections], CovidError>?
    
    static let HospitalTab = HospitalCollections(results: [], status: "")


    //MARK: - methods from APIServiceProtocols
    func requestInfos(with country: String, callback: @escaping Callback) {
        let _: URL! = try! MockGoogleDataflow.createURL(with: country)
        callback(false, country)
    }
    
    static func createURL(with country: String) throws -> URL? {
        let completeURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=48.850000%2C2.350000&key=AIzaSyDvrNXWWCJmE7LpWIxC86CHxVRogCRCIwI&type=hospital&radius=1500"
        return URL(string: completeURL)
        
    }
    
    static func parse<HospitalCollections: Decodable>(_ data: Data) -> HospitalCollections {
        do {
            let covid = try JSONDecoder().decode(HospitalCollections.self, from: data)
            return covid
        } catch {

            print("Unknown error")
        }
        return HospitalTab as! HospitalCollections
    }
    
    // Fetch Failed
    func fetchFail(error: CovidError?) {
        guard error != nil else {
            return}
        print("error")

        
    }
        
    
}
