//
//  CovidService.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 17/11/2021.
//

import Foundation
import Alamofire

//// MARK: - API Service
//
//class GoogleService : APIService {
//    // MARK: - Properties
//    static let hospitalTab = CovidCollections(covidInfo: [])
//  
//    func requestInfos(with country: String, callback: @escaping Callback) {
//        // Try api call or return callback false nil if url is good
//        let url: URL!
//        do {
//            
//           url = try GoogleService.createURL(with: country)
//            
//        } catch {
//            return callback(false, nil)
//        }
//        
//        // make the api call with alamo if the adress is good
//        
//        AF.request(url, method: .get).responseJSON { response in
//            // parse data if sucess and callback true with ressources
//            switch response.result {
//            case .success:
//                let resource: CovidCollections = GoogleService.parse(response.data!)
//                print(resource)
//                callback(true, resource)
//                // print error if failure and callback false with nil
//            case .failure(let error):
//                print("Error : \(error)" )
//                
//                callback(false, nil)
//                
//            }
//        }
//    }
//   
//
//   
//    static func createURL(with country: String) throws -> URL? {
//        let completeURL = Endpoint.endpointGooglePlace + country
//        
//        return URL(string: completeURL)
//    }
//    
//    static func parse<HospitalCollections: Decodable>(_ data: Data) -> HospitalCollections {
//        do {
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            let root = try decoder.decode(HospitalCollections.self, from: data)
//            print(root)
//        } catch {
//            print("\(String(describing: try? CovidError.noInfoFound.errorMessages()))")
//        }
//       
//        // result as recipecollection above
//        return self.hospitalTab as! HospitalCollections
//    }
//    
//    
//}
