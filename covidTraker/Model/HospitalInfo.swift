//
//  HospitalInfo.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 19/11/2021.
//

import Foundation


struct HospitalCollections: Codable {
    var results: [SearchResult]
    var status: String
}

struct SearchResult: Codable {
    var id: String
    var icon: String
    var name: String
    var placeId: String
    var reference: String
    var types: [String]
    var vicinity: String
    var geometry: Geometry
    var photos: [Photo]
    var openingHours: [String:Bool]?
}

struct Geometry: Codable  {
    var location: Location
}

struct Location: Codable  {
    var lat: Double
    var lng: Double
}

struct Photo: Codable {
    var height: Double
    var width: Double
    var photoReference: String
}
