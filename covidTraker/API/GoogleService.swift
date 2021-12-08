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
    static let HospitalTab : [HospitalCollections] = []
  
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
                let resource: HospitalCollections = DataFlowService.parse(response.data!)
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
       
        
        var coordinates : [Coordinates] = []
        let baseURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="
        
        NotificationCenter.default.addObserver(forName: .newCoordinatesPost, object: nil, queue: .main) { notification in
                    // Display image
            guard let getcoord = notification.object as? Coordinates else {
                return
            }
            coordinates.append(getcoord)
           
        }
        
       
        
        let completeURL = baseURL + (coordinates.first?.latitude) + "%2C" + (coordinates.first?.longitude) + "&key=\(Constants.valueAPIKey("GoogleApi"))&type=hospital&radius=500"
        print(completeURL)
        return URL(string: completeURL)
    }
    
    
 
    static func parse<HospitalCollections: Decodable>(_ data: Data) -> HospitalCollections {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let root = try decoder.decode(HospitalCollections.self, from: data)
            print(root)
            return root
        } catch {
            print(error)
        }
       
        // result as recipecollection above
        return self.HospitalTab as! HospitalCollections
    }
    
  
    
    
}
