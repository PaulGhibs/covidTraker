//
//  CovidInfo.swift
//  covidTracker
//
//  Created by Paul Ghibeaux on 17/11/2021.
//
import Foundation



// MARK: - CovidCollections


// MARK: - CovidCollections
struct CovidCollections: Codable {
    let country: Country

    enum CodingKeys: String, CodingKey {
        case country = "All"
    }
}


// MARK: - country
struct Country {
    
    let confirmed, recovered, deaths: Int
    let country: String
    let population, sqKMArea: Int
    let lifeExpectancy: String
    let continent: String
    let capitalCity, updated: String
    
}




// converting json struct to swift class
extension Country: Codable {
    
    enum Rename: String, CodingKey {
        case country
        case confirmed = "confirmed"
        case recovered = "recovered"
        case deaths = "deaths"
        case population = "population"
        case sqKMArea = "sq_km_area"
        case lifeExpectancy = "life_expectancy"
        case continent = "continent"
        case capitalCity = "capital_city"
        case updated = "updated"
    }
    
    // decode each codingkey from json
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Rename.self)
        
        let country = try container.nestedContainer(keyedBy: Rename.self, forKey: .country)
        self.country = try country.decode(String.self, forKey: .country)
        confirmed = try country.decode(Int.self, forKey: .confirmed)
        recovered = try country.decode(Int.self, forKey: .recovered)
        population = try country.decode(Int.self, forKey: .recovered)
        deaths = try country.decode(Int.self, forKey: .recovered)

        sqKMArea = try country.decode(Int.self, forKey: .sqKMArea)
        lifeExpectancy = try country.decode(String.self, forKey: .lifeExpectancy)
        continent = try country.decode(String.self, forKey: .continent)
        capitalCity = try country.decode(String.self, forKey: .capitalCity)
        updated = try country.decode(String.self, forKey: .updated)
    }
}




