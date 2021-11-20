//
//  Constants.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 19/11/2021.
//

import Foundation
// Hide Api key in a property list file and add the name to the .gitignore file
struct Constants {
    static func valueAPIKey(_ nameKey: String) -> String {
        //  path to ApiKeys.plist
        let path = Bundle.main.path(forResource: "ApiKeys", ofType: "plist")
        // dictionnary for key
        let plist = NSDictionary(contentsOfFile: path!)
        // result of the key
        let value: String = (plist?.object(forKey: nameKey) as? String)!
        // value of each apikey
        return value
    }
}




struct Endpoint {
 static let endpointGooglePlace = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?&key=\(Constants.valueAPIKey("apiPlaces"))&type=hospital&radius=500"
    // API KEYS setup in constants.swift
    
}



