//
//  MediaGroupService.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 20/11/2021.
//

import Foundation
import Alamofire
// MARK: - API Service


class DataFlowService : APIService {
    // MARK: - Properties
    static let covidTab : [CovidCollection] = []
  
    func requestInfos(with country: String, callback: @escaping Callback) {
        // Try api call or return callback false nil if url is good
        let url: URL!
        do {
            
           url = try DataFlowService.createURL()
            
        } catch {
            return callback(false, nil)
        }
        
        // make the api call with alamo if the adress is good
        
        AF.request(url, method: .get).responseJSON { response in
            // parse data if sucess and callback true with ressources
            switch response.result {
            case .success:
                let resource: CovidCollection = DataFlowService.parse(response.data!)
                callback(true, resource)
                // print error if failure and callback false with nil
            case .failure(let error):
                print("Error : \(error)" )
                callback(false, nil)
                
            }
        }
    }
   

   
    static func createURL() throws -> URL? {
        let completeURL = "https://covid-19.dataflowkit.com/v1/world"
        return URL(string: completeURL)
    }
    
    static func parse<CovidCollection: Decodable>(_ data: Data) -> CovidCollection {
        do {
            let covid = try JSONDecoder().decode(CovidCollection.self, from: data)
            return covid
            
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
        return self.covidTab as! CovidCollection
    }
    
    
}
