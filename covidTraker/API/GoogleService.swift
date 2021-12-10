//
//  GoogleService.swift
//  covidTraker
//
//  Created by Paul Ghb on 01/12/2021.
//

import Foundation
import Alamofire
import CoreLocation
// MARK: - API Service


class GoogleMapService: APIService {

    // MARK: - Properties
    static let HospitalTab = HospitalCollections(results: [], status: "")
    static var latitude: String {
        get {
            return UserDefaults.standard.string(forKey: "latitude") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "longitude")
        }
        
    }
    static var longitude: String {
        get {
            return UserDefaults.standard.string(forKey: "longitude") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "longitude")
        }
    }
    
    func requestInfos(with country: String, callback: @escaping DataFlowService.Callback) {
        // Try api call or return callback false nil if url is good
        let url: URL!
        do {
            
            url = try GoogleMapService.createURL()
            
        } catch {
            return callback(false, nil)
        }
        
        // make the api call with alamo if the adress is good
        
        AF.request(url, method: .get).responseJSON { response in
            // parse data if sucess and callback true with ressources
            switch response.result {
            case .success:
                let resource: HospitalCollections = GoogleMapService.parse(response.data!)
                callback(true, resource)
                print(resource)
                // print error if failure and callback false with nil
            case .failure(let error):
                print("Error : \(error)" )
                callback(false, nil)
                
            }
        }
    }
   

   
    static func createURL() throws -> URL? {
    let baseURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude)%2C\(longitude)&key=\(Constants.valueAPIKey("GoogleApi"))&type=hospital&radius=1500"
       print(baseURL)
        return URL(string: baseURL)
    }
    
    
 
    static func parse<HospitalCollections: Decodable>(_ data: Data) -> HospitalCollections {
        do {
            let hospital = try JSONDecoder().decode(HospitalCollections.self, from: data)
            return hospital
            
        } catch DecodingError.dataCorrupted(let context) {
                print(context.debugDescription)
            } catch DecodingError.keyNotFound(let key, let context) {
                print("\(key.stringValue) was not found, \(context.debugDescription)")
            } catch DecodingError.typeMismatch(let type, let context) {
                print("\(type) was expected, \(context.debugDescription)")
            } catch DecodingError.valueNotFound(let type, let context) {
                print("no value was found for \(type), \(context.debugDescription)")
            
        } catch {
            print("Unknown error")
        }
       
        // result as recipecollection above
        return self.HospitalTab as! HospitalCollections
    }
 
    
    
}
