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
  
    func requestInfos(with country: String, callback: @escaping DataFlowService.Callback) {
        // Try api call or return callback false nil if url is good
        let url: URL!
        do {
            
            url = try DataFlowService.createURL(with: country)
            
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
   

   
    static func createURL(with country: String) throws -> URL? {
       
        let completeURL = "https://covid-19.dataflowkit.com/v1/" + country.replacingOccurrences(of: "United States", with: "USA")
        return URL(string: completeURL)

    }
    
    static func parse<CovidCollection: Decodable>(_ data: Data) -> CovidCollection {
        do {
            let covid = try JSONDecoder().decode(CovidCollection.self, from: data)
            return covid
            
    
        } catch {
            print("Unknown error")
        }
       
        // result as recipecollection above
        return self.covidTab as! CovidCollection
    }
    
    
}
