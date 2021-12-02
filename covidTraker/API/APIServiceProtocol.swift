//
//  APIServiceProtocol.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 17/11/2021.
//

import Foundation

protocol APIService {

        // Provide the state of the edamam response
        typealias Callback = (Bool, Any?) -> Void
        func requestInfos(with country: String, callback: @escaping Callback)
        // Build and return a  URL to access edamam API resource
        // Decode JSON data thanks to a Decodable type
        static func parse <T: Decodable>(_ data: Data) -> T

}

